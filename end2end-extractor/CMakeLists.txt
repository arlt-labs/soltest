file(GLOB_RECURSE sources "*.cpp")
file(GLOB_RECURSE headers "*.h")

find_package(Threads)

add_executable(end2end-extractor ${sources} ${headers})

include_directories(${CMAKE_CURRENT_BINARY_DIR}/../../)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/../include)
target_link_libraries(end2end-extractor ${CMAKE_THREAD_LIBS_INIT} ${Boost_FILESYSTEM_LIBRARIES} ${Boost_SYSTEM_LIBRARIES})
