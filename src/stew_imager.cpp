// TODO: implement aov's
// TODO: implement render regions


#include <ai.h>
#include <string>
#include <string_view>
#include <filesystem>
#include <vector>
#include <regex>
#include <iostream>
#include <cmath>


inline void linear_pixel_to_x_y(const int linear_pixel, const int width, int &x, int &y) {
  x = linear_pixel % width;
  y = std::floor(linear_pixel / width);
}

static bool ends_with(std::string_view str, std::string_view suffix)
{
    return str.size() >= suffix.size() && 0 == str.compare(str.size()-suffix.size(), suffix.size(), suffix);
}

AI_DRIVER_NODE_EXPORT_METHODS(StewImagerMtd);


node_parameters 
{
  AiMetaDataSetStr(nentry, nullptr, AtString("subtype"), AtString("imager"));
  // AiParameterStr(AtString("layer_selection"), AtString("*")); // if enabled, mtoa/c4dtoa will only run over rgba (hardcoded for now)
  AiParameterBool(AtString("enable"), true);
  AiParameterStr(AtString("source_directory"), "");
  // AiMetaDataSetBool(nentry, nullptr, "force_update", true);
}


 
node_initialize
{
  AiDriverInitialize(node, false);
}
 
node_update {
    AtUniverse *universe = AiNodeGetUniverse(node);
    AtRenderSession *render_session_duplicate = AiUniverseGetRenderSession(universe);
    AiRenderSetHintInt(render_session_duplicate, AtString("imager_padding"), 0);
    AiRenderSetHintInt(render_session_duplicate, AtString("imager_schedule"), 0x02); // SEEMS TO CAUSE ISSUES WITH NEGATIVE RENDER REGIONS    
}
 
driver_supports_pixel_type 
{
  return  pixel_type == AI_TYPE_RGBA || 
          pixel_type == AI_TYPE_RGB || 
          pixel_type == AI_TYPE_FLOAT || 
          pixel_type == AI_TYPE_VECTOR;
}
 
driver_open {}
 
driver_extension
{
   static const char *extensions[] = {NULL};
   return extensions;
}
 
driver_needs_bucket
{
   return true; // API: true if the bucket needs to be rendered, false if it can be skipped
}
 
driver_prepare_bucket {} // called before a bucket is rendered


 
driver_process_bucket {
 
  AiOutputIteratorReset(iterator);

  AtUniverse *universe = AiNodeGetUniverse(node);
  AtNode *options_node = AiUniverseGetOptions(universe);
  const unsigned xres_global = AiNodeGetInt(options_node, AtString("xres"));
  const unsigned yres_global = AiNodeGetInt(options_node, AtString("yres"));
  std::string directory = AiNodeGetStr(node, AtString("source_directory")).c_str();

  std::string ls_command = "ls " + directory;
  system(ls_command.c_str());

  std::vector<AtRGBA> buffer(xres_global * yres_global);

  
  for (const auto &entry : std::filesystem::directory_iterator(directory)) {
    std::string filename_string = entry.path().c_str();
    // AiMsgInfo("Image path: %s", filename_string.c_str());

    if (!ends_with(filename_string, std::string(".exr"))) continue;
    
    unsigned chunk_region_min_x, chunk_region_max_x, chunk_region_min_y, chunk_region_max_y;

    std::regex rgx("chunk_(\\d+)_(\\d+)_(\\d+)_(\\d+)");
    std::smatch regex_matches;

    if (std::regex_search(filename_string, regex_matches, rgx)) {
      chunk_region_min_x = std::atoi(regex_matches[1].str().c_str());
      chunk_region_max_x = std::atoi(regex_matches[2].str().c_str());
      chunk_region_min_y = std::atoi(regex_matches[3].str().c_str());
      chunk_region_max_y = std::atoi(regex_matches[4].str().c_str());
      // AiMsgInfo("Chunk data: %d %d %d %d", chunk_region_min_x, chunk_region_max_x, chunk_region_min_y, chunk_region_max_y);
    } else {
      AiMsgError("[STEW IMAGER] %s : does not have the correct bounding specifications in it's filename.", filename_string.c_str());
    }

    // TODO: handle the case where the exr has been created, but not completed. The following function calls throw an error, which may have to be intercepted and continued.
    unsigned resolution_chunk_x, resolution_chunk_y, nchannels;
    if (!AiTextureGetResolution(entry.path().c_str(), &resolution_chunk_x, &resolution_chunk_y) || !AiTextureGetNumChannels(entry.path().c_str(), &nchannels)) continue;

    const int npixels = resolution_chunk_x * resolution_chunk_y;
    const int64_t nbytes = resolution_chunk_x * resolution_chunk_y * nchannels * sizeof(float);
    float *pixel_data = (float*)AiMalloc(nbytes);
    AiTextureLoad(AtString(entry.path().c_str()), true, 0, pixel_data);


    std::vector<AtRGBA> buffer_local;
    for (int i=0; i<npixels*nchannels; i+=nchannels) {
      AtRGBA pixel_rgba = AtRGBA(pixel_data[i], pixel_data[i+1], pixel_data[i+2], nchannels > 3 ? pixel_data[i+3] : 1.0);
      buffer_local.push_back(pixel_rgba);
    }

    for (int i=0; i<buffer_local.size(); i++) {
      int x_local, y_local;
      linear_pixel_to_x_y(i, resolution_chunk_x, x_local, y_local);
      y_local = resolution_chunk_y - y_local;

      const int x_global = x_local + chunk_region_min_x;
      const int y_global = y_local + chunk_region_min_y;

      const int linear_pixel_global = x_global + yres_global * y_global;
      buffer[linear_pixel_global] = buffer_local[i];
    }
  }

  
  AtString aov_name = AtString("");
  int aov_type = 0;
  const void *bucket_data = nullptr;

  while (AiOutputIteratorGetNext(iterator, &aov_name, &aov_type, &bucket_data)){
    for (int j = 0; j < bucket_size_y; ++j) {
      for (int i = 0; i < bucket_size_x; ++i) {
        int y = j + bucket_yo;
        int x = i + bucket_xo;
        int in_idx = j * bucket_size_x + i;
        int linear_pixel = x + y * yres_global;
      
        // note, converting all to AtRGBA because the lentil_filter converts any type to AtRGBA.
        // switch (aov_current->type){
        //   case AI_TYPE_RGBA: {
        AtRGBA image = buffer[linear_pixel];
        ((AtRGBA*)bucket_data)[in_idx] = image;
          
        }
      }
    }
}


driver_write_bucket {}
 
driver_close {}
 
node_finish {}


 void registerStewImager(AtNodeLib* node) {
    node->methods = (AtNodeMethods*) StewImagerMtd;
    node->output_type = AI_TYPE_NONE;
    node->name = "imager_stew";
    node->node_type = AI_NODE_DRIVER;
    strcpy(node->version, AI_VERSION);
}