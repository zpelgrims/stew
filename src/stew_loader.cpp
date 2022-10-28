#include <ai.h>
#include <cstring>

typedef void (*NodeRegisterFunc)(AtNodeLib* node);

void registerStewImager(AtNodeLib* node);
// void registerStewOperator(AtNodeLib* node);

static NodeRegisterFunc registry[] = {
    &registerStewImager,
//    &registerStewOperator
};

static const int num_nodes = sizeof(registry) / sizeof(NodeRegisterFunc);

node_loader {
    if (i >= num_nodes)
        return false;

    strcpy(node->version, AI_VERSION);
    (*registry[i])(node);

    return true;
}