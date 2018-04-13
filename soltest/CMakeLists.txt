file(GLOB_RECURSE sources "*.cpp")
file(GLOB_RECURSE headers "*.h")

find_package(Threads)

include_directories(${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/deps/include)

link_directories(${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libsolc
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libsolidity
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/liblll
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libevmasm
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libdevcore
		${CMAKE_CURRENT_BINARY_DIR}/../cpp-ethereum-git/src/cpp-ethereum-git-build/libevmexec)

add_definitions(-DBOOST_TEST_DYN_LINK -DBOOST_TEST_NO_MAIN -DBOOST_TEST_ALTERNATIVE_INIT_API)
add_executable(soltest ${sources} ${headers})
add_dependencies(soltest soltesting solidity-git-build cpp-ethereum-git-build)

include_directories(${CMAKE_CURRENT_BINARY_DIR}/../../)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/../include)
target_link_libraries(soltest soltesting)
