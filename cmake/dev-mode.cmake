
if(NOT GXZN_THRDS_DEV_MODE)
	return()
endif()

if(GXZN_THRDS_BUILD_TEST)
	enable_testing()
	add_subdirectory(${GXZN_THRDS_TEST_DIR})
endif()

if(GXZN_THRDS_GENERATE_DOCS)
	include(${GXZN_THRDS_ROOT}/cmake/automatics/docs.cmake)
endif()
