cmake_minimum_required(VERSION 2.8.12)

file(GLOB_RECURSE sources "*.cpp")
file(GLOB_RECURSE headers "*.h")

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

link_directories(${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libsolc
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libsolidity
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/liblll
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libevmasm
		${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libdevcore
		${CMAKE_CURRENT_BINARY_DIR}/../cpp-ethereum-git/src/cpp-ethereum-git-build/libevmexec)

add_executable(heatmap ${sources} ${headers} qml.qrc)
add_dependencies(heatmap soltesting solidity-git-build cpp-ethereum-git-build)
target_link_libraries(heatmap soltesting jsoncpp Qt5::Core Qt5::Quick)
