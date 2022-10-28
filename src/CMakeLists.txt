set(SRC stew_loader.cpp stew_imager.cpp)
set(SHADER stew)

add_library(${SHADER} SHARED ${SRC})

target_link_libraries(${SHADER} ai)
set_target_properties(${SHADER} PROPERTIES PREFIX "")

install(TARGETS ${SHADER} DESTINATION ${DSO_INSTALL_DIR})