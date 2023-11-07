
set(USE_FOLDERS ON)
set(CMAKE_REQUIRED_QUIET ON)

list(APPEND CMAKE_MODULE_PATH
	${GXZN_THRDS_ROOT}/cmake
	${GXZN_THRDS_ROOT}/cmake/tools
)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	set(GXZN_THRDS_IS_TOPLEVEL_PROJECT TRUE)
else()
	set(GXZN_THRDS_IS_TOPLEVEL_PROJECT FALSE)
endif()

option(GXZN_THRDS_BUILD_TEST           "Build threads's tests"    ${GXZN_THRDS_IS_TOPLEVEL_PROJECT})
option(GXZN_THRDS_DEV_MODE             "Developer mode"              ${GXZN_THRDS_IS_TOPLEVEL_PROJECT})
option(GXZN_THRDS_GENERATE_INFO_HEADER "Generate info header"        OFF)
option(GXZN_THRDS_GENERATE_DOCS        "Generate MCSS documentation" OFF)
mark_as_advanced(GXZN_THRDS_DEV_MODE GXZN_THRDS_GENERATE_INFO_HEADER GXZN_THRDS_GENERATE_DOCS)

include(GetSystemInfo)

get_system_info(GXZN_THRDS_SYSTEM GXZN_THRDS_ARCH)

set(GXZN_THRDS_OUT ${CMAKE_BINARY_DIR})
set(GXZN_THRDS_CODE_DIR ${GXZN_THRDS_ROOT}/code  CACHE PATH "Code directory")
set(GXZN_THRDS_TEST_DIR ${GXZN_THRDS_ROOT}/tests CACHE PATH "Tests directory")
set(GXZN_THRDS_DOCS_DIR ${GXZN_THRDS_ROOT}/docs  CACHE PATH "Documentation directory")

# App info
set(GXZN_THRDS_APP_AUTHOR         "Ruslan Golovinskii")

if (NOT CMAKE_CXX_STANDARD)
	set(CMAKE_CXX_STANDARD 20)
endif()

if(CMAKE_CXX_STANDARD LESS 20)
	message(FATAL_ERROR "CMAKE_CXX_STANDARD must be at least 20")
endif()

message(STATUS "-- -- -- -- -- -- -- threads configuration -- -- -- -- -- -- -- --")
message(STATUS "System:                 ${GXZN_THRDS_SYSTEM} (${GXZN_THRDS_ARCH})")
message(STATUS "C++ Standard:           ${CMAKE_CXX_STANDARD}")
message(STATUS "C Standard:             ${CMAKE_C_STANDARD}")
message(STATUS "Compiler (ID):          ${CMAKE_CXX_COMPILER_ID} (${CMAKE_CXX_COMPILER_ID})")
message(STATUS "Root directory:         ${GXZN_THRDS_ROOT}")
message(STATUS "Build directory:        ${GXZN_THRDS_OUT}")
message(STATUS "Code directory:         ${GXZN_THRDS_CODE_DIR}")
message(STATUS "Top level:              ${GXZN_THRDS_IS_TOPLEVEL_PROJECT}")

if(GXZN_THRDS_DEV_MODE)
	message(STATUS "Tests:                  ${GXZN_THRDS_BUILD_TEST}")
	message(STATUS "Generate info header:   ${GXZN_THRDS_GENERATE_INFO_HEADER}")
	message(STATUS "Generate documentation: ${GXZN_THRDS_GENERATE_DOCS}")
	message(STATUS "Documentation directory:${GXZN_THRDS_DOCS_DIR}")
endif()

message(STATUS "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --")

find_program(ccache_program ccache)
if (NOT ${ccache_program} MATCHES "NOTFOUND")
	set(CMAKE_C_COMPILER_LAUNCHER ccache)
	set(CMAKE_CXX_COMPILER_LAUNCHER ccache)
endif()
