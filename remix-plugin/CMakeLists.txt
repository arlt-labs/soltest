file(GLOB_RECURSE sources "*.cpp")
file(GLOB_RECURSE headers "*.h")

find_package(Threads)

link_directories(${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libsolc
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libsolidity
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/liblll
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libevmasm
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libdevcore
		${CMAKE_CURRENT_BINARY_DIR}/../cpp-ethereum-git/src/cpp-ethereum-git-build/libevmexec)

find_library(POCO_FOUNDATION PocoFoundation)
find_library(POCO_NET PocoNet)
find_library(POCO_UTIL PocoUtil)
find_library(POCO_XML PocoXML)
find_library(POCO_JSON PocoJSON)
find_library(POCO_ZIP PocoZip)

add_executable(remix-plugin ${sources} ${headers})
add_dependencies(remix-plugin soltesting solidity-git-build cpp-ethereum-git-build)

include_directories(${CMAKE_CURRENT_BINARY_DIR}/../../)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/../include)
target_link_libraries(remix-plugin soltesting jsoncpp ${Boost_UNIT_TEST_FRAMEWORK_LIBRARIES} ${POCO_FOUNDATION} ${POCO_NET} ${POCO_UTIL} ${POCO_XML} ${POCO_JSON} ${POCO_ZIP})
