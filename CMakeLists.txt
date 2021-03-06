cmake_minimum_required(VERSION 3.1.0)

set(ETH_CMAKE_DIR "${CMAKE_CURRENT_LIST_DIR}/cmake" CACHE PATH "The the path to the cmake directory")
list(APPEND CMAKE_MODULE_PATH ${ETH_CMAKE_DIR})

# Set cmake_policies
include(EthPolicy)
eth_policy()

# project name and version should be set after cmake_policy CMP0048
set(PROJECT_VERSION "0.0.1")
project(soltest VERSION ${PROJECT_VERSION})

# Let's find our dependencies
include(EthDependencies)
include(jsoncpp)

# Figure out what compiler and system are we using
include(EthCompilerSettings)

# Include utils
include(EthUtils)

# Create license.h from LICENSE.txt and template
# Converting to char array is required due to MSVC's string size limit.
file(READ ${CMAKE_SOURCE_DIR}/LICENSE.txt LICENSE_TEXT HEX)
string(REGEX MATCHALL ".." LICENSE_TEXT "${LICENSE_TEXT}")
string(REGEX REPLACE ";" ",\n\t0x" LICENSE_TEXT "${LICENSE_TEXT}")
set(LICENSE_TEXT "0x${LICENSE_TEXT}")

configure_file("${CMAKE_SOURCE_DIR}/cmake/templates/license.h.in" include/license.h)

include(EthOptions)
configure_project(TESTS TOOLS HEATMAP)

include(ExternalProject)
ExternalProject_Add(solidity-git
		PREFIX ${CMAKE_CURRENT_BINARY_DIR}/solidity-git
		GIT_REPOSITORY git@github.com:aarlt/solidity.git
		GIT_TAG 971dfae0b7fce7657187141a556bf14b0e397c90 # GIT_TAG external_natspec
		CMAKE_ARGS -DTESTS=OFF -DTOOLS=OFF
		-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
		-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
		-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
		BUILD_COMMAND make solidity libsolc evmasm devcore lll
		STEP_TARGETS build
		EXCLUDE_FROM_ALL TRUE
		)

ExternalProject_Add(cpp-ethereum-git
		PREFIX ${CMAKE_CURRENT_BINARY_DIR}/cpp-ethereum-git
		GIT_REPOSITORY git@github.com:aarlt/cpp-ethereum.git
		GIT_TAG e257654a8c00edf9c505a92c587a57c8647021e2 # GIT_TAG libevmexec
		BUILD_COMMAND make evmexec
		CMAKE_ARGS -DTESTS=OFF -DTOOLS=OFF
		-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
		-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
		-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
		STEP_TARGETS build
		EXCLUDE_FROM_ALL TRUE
		)

if (NOT DEFINED CMAKE_PREFIX_PATH)
	set(CMAKE_PREFIX_PATH "/Users/alex/Qt/5.10.1/clang_64")
endif(NOT DEFINED CMAKE_PREFIX_PATH)

include_directories(${CMAKE_SOURCE_DIR})
include_directories(${CMAKE_BINARY_DIR}/solidity-git/src/solidity-git)
include_directories(${CMAKE_BINARY_DIR}/solidity-git/src/solidity-git-build/deps/include)

add_subdirectory(libsoltesting)
if (TOOLS)
	add_subdirectory(remix-plugin)
	add_subdirectory(end2end-extractor)
endif ()

if (HEATMAP)
	add_subdirectory(heatmap)
endif ()

if (TESTS)
	add_subdirectory(test)
endif ()
add_subdirectory(soltest)
