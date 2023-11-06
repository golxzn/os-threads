cmake_minimum_required(VERSION 3.25)

set(GXZN_GXZN_THRDS_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

project(golxzn.os.threads
	VERSION 0.1.0
	DESCRIPTION "Multithreading features of golxzn::os module"
	LANGUAGES CXX
)

include(${GXZN_GXZN_THRDS_ROOT}/cmake/options.cmake)
include(${GXZN_GXZN_THRDS_ROOT}/cmake/definitions.cmake)

add_subdirectory(${GXZN_GXZN_THRDS_CODE_DIR})

include(${GXZN_GXZN_THRDS_ROOT}/cmake/dev-mode.cmake)
