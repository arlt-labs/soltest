file(GLOB_RECURSE sources "*.cpp")
file(GLOB_RECURSE headers "*.h")

find_package(Threads)

link_directories(${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libsolc
                ${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libsolidity
                ${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/liblll
                ${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libevmasm
                ${CMAKE_CURRENT_BINARY_DIR}/../solidity-git/src/solidity-git-build/libdevcore
                ${CMAKE_CURRENT_BINARY_DIR}/../cpp-ethereum-git/src/cpp-ethereum-git-build/libevmexec)

include_directories(${CMAKE_CURRENT_BINARY_DIR}/../../)
message(${CMAKE_CURRENT_BINARY_DIR})
add_executable(soltest ${sources} ${headers})
add_dependencies(soltest soltesting solidity-git-build cpp-ethereum-git-build)
target_link_libraries(soltest soltesting ${Boost_UNIT_TEST_FRAMEWORK_LIBRARIES})
