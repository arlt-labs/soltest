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

add_library(soltesting ${sources} ${headers})
add_dependencies(soltesting solidity-git-build)
target_link_libraries(soltesting PUBLIC solc solidity evmasm devcore evmexec)