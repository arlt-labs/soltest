# generates BuildInfo.h
# 
# this module expects
# ETH_SOURCE_DIR - main CMAKE_SOURCE_DIR
# ETH_DST_DIR - main CMAKE_BINARY_DIR
# ETH_BUILD_TYPE
# ETH_BUILD_PLATFORM
#
# example usage:
# cmake -DETH_SOURCE_DIR=. -DETH_DST_DIR=build -DETH_BUILD_TYPE=Debug -DETH_BUILD_PLATFORM=Darwin.appleclang -P scripts/buildinfo.cmake
#
# Its main output variables are SOLTEST_VERSION_BUILDINFO and SOLTEST_VERSION_PRERELEASE

if (NOT ETH_BUILD_TYPE)
	set(ETH_BUILD_TYPE "unknown")
endif ()

if (NOT ETH_BUILD_PLATFORM)
	set(ETH_BUILD_PLATFORM "unknown")
endif ()

# Logic here: If prereleases.txt exists but is empty, it is a non-pre release.
# If it does not exist, create our own prerelease string
if (EXISTS ${ETH_SOURCE_DIR}/prerelease.txt)
	file(READ ${ETH_SOURCE_DIR}/prerelease.txt SOLTEST_VERSION_PRERELEASE)
	string(STRIP "${SOLTEST_VERSION_PRERELEASE}" SOLTEST_VERSION_PRERELEASE)
else ()
	string(TIMESTAMP SOLTEST_VERSION_PRERELEASE "develop.%Y.%m.%d" UTC)
	string(REPLACE .0 . SOLTEST_VERSION_PRERELEASE "${SOLTEST_VERSION_PRERELEASE}")
endif ()

if (EXISTS ${ETH_SOURCE_DIR}/commit_hash.txt)
	file(READ ${ETH_SOURCE_DIR}/commit_hash.txt SOLTEST_COMMIT_HASH)
	string(STRIP ${SOLTEST_COMMIT_HASH} SOLTEST_COMMIT_HASH)
else ()
	execute_process(
			COMMAND git --git-dir=${ETH_SOURCE_DIR}/.git --work-tree=${ETH_SOURCE_DIR} rev-parse --short=8 HEAD
			OUTPUT_VARIABLE SOLTEST_COMMIT_HASH OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET
	)
	execute_process(
			COMMAND git --git-dir=${ETH_SOURCE_DIR}/.git --work-tree=${ETH_SOURCE_DIR} diff HEAD --shortstat
			OUTPUT_VARIABLE SOLTEST_LOCAL_CHANGES OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET
	)
endif ()

if (SOLTEST_COMMIT_HASH)
	string(STRIP ${SOLTEST_COMMIT_HASH} SOLTEST_COMMIT_HASH)
	string(SUBSTRING ${SOLTEST_COMMIT_HASH} 0 8 SOLTEST_COMMIT_HASH)
endif ()

if (NOT SOLTEST_COMMIT_HASH)
	message(FATAL_ERROR "Unable to determine commit hash. Either compile from within git repository or "
			"supply a file called commit_hash.txt")
endif ()
if (NOT SOLTEST_COMMIT_HASH MATCHES [a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9])
	message(FATAL_ERROR "Malformed commit hash \"${SOLTEST_COMMIT_HASH}\". It has to consist of exactly 8 hex digits.")
endif ()

if (SOLTEST_COMMIT_HASH AND SOLTEST_LOCAL_CHANGES)
	set(SOLTEST_COMMIT_HASH "${SOLTEST_COMMIT_HASH}.mod")
endif ()

set(SOLTEST_VERSION_COMMIT "commit.${SOLTEST_COMMIT_HASH}")
set(SOLTEST_VERSION_PLATFORM ETH_BUILD_PLATFORM)
set(SOLTEST_VERSION_BUILDINFO "commit.${SOLTEST_COMMIT_HASH}.${ETH_BUILD_PLATFORM}")

set(TMPFILE "${ETH_DST_DIR}/BuildInfo.h.tmp")
set(OUTFILE "${ETH_DST_DIR}/BuildInfo.h")

configure_file("${ETH_BUILDINFO_IN}" "${TMPFILE}")

include("${ETH_CMAKE_DIR}/EthUtils.cmake")
replace_if_different("${TMPFILE}" "${OUTFILE}" CREATE)

