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

find_package(Z3 QUIET)
if (${Z3_FOUND})
	include_directories(${Z3_INCLUDE_DIR})
	add_definitions(-DHAVE_Z3)
	message("Z3 SMT solver found. This enables optional SMT checking.")
else ()
	message("Z3 SMT solver NOT found. Optional SMT checking will not be available. Please install Z3 if it is desired.")
	list(REMOVE_ITEM sources "${CMAKE_CURRENT_SOURCE_DIR}/formal/Z3Interface.cpp")
endif ()

find_library(POCO_FOUNDATION PocoFoundation)

add_library(soltesting ${sources} ${headers})
add_dependencies(soltesting solidity-git-build soltest_BuildInfo.h jsoncpp)
target_link_libraries(soltesting PUBLIC solc solidity evmasm devcore evmexec ${JSONCPP_LIBRARY} ${Boost_FILESYSTEM_LIBRARIES} ${Boost_REGEX_LIBRARIES} ${Boost_SYSTEM_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} ${POCO_FOUNDATION})

if (${Z3_FOUND})
	target_link_libraries(soltesting PUBLIC ${Z3_LIBRARY})
endif ()
