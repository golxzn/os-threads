cmake_minimum_required(VERSION 3.25)

if (GXZN_THRDS_GENERATE_INFO_HEADER)
	include(TargetInfoHeader)
	make_target_info_header(
		TARGET golxzn_os_threads
		OUTPUT_PATH ${GXZN_THRDS_CODE_DIR}/headers/golxzn
		FILENAME threads_about
		NAMESPACE golxzn::about
		PARAMETERS
			APP_NAME "golxzn.os.threads"
			APP_VERSION "${PROJECT_VERSION}"
			APP_DESCRIPTION "${PROJECT_DESCRIPTION}"
	)
endif()

file(GLOB_RECURSE headers RELATIVE ${GXZN_THRDS_CODE_DIR} CONFIGURE_DEPENDS "*.hpp")
file(GLOB_RECURSE sources RELATIVE ${GXZN_THRDS_CODE_DIR} CONFIGURE_DEPENDS "*.cpp")

source_group(TREE ${GXZN_THRDS_CODE_DIR}/headers FILES ${headers})
source_group(TREE ${GXZN_THRDS_CODE_DIR}/sources FILES ${sources})

add_library(golxzn_os_threads ${headers} ${sources})
add_library(golxzn::os::threads ALIAS golxzn_os_threads)

target_include_directories(golxzn_os_threads PUBLIC ${GXZN_THRDS_CODE_DIR}/headers)
target_compile_definitions(golxzn_os_threads PUBLIC ${GXZN_THRDS_DEFINITIONS})
set_target_properties(golxzn_os_threads PROPERTIES
	FOLDER "golxzn/os"
)
