
if(NOT GXZN_THRDS_BUILD_TEST)
	return()
endif()

include(FetchContent)

set(BUILD_SHARED_LIBS OFF)

message(CHECK_START "Fetching Catch2...")
FetchContent_Declare(Catch2
	GIT_REPOSITORY https://github.com/catchorg/Catch2.git
	GIT_TAG        v3.3.2
)

FetchContent_MakeAvailable(Catch2)
message(CHECK_PASS "Catch2 fetched")

file(GLOB_RECURSE sources CONFIGURE_DEPENDS "${GXZN_THRDS_TEST_DIR}/code/*.cpp")
file(GLOB_RECURSE headers CONFIGURE_DEPENDS "${GXZN_THRDS_TEST_DIR}/code/*.h")

add_executable(threads_tests ${sources} ${headers})
target_link_libraries(threads_tests PRIVATE
	golxzn::os::threads
	Catch2::Catch2WithMain
)
set_target_properties(threads_tests PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY ${GXZN_THRDS_ROOT}/bin
	FOLDER "golxzn/tests"
)

include(CTest)
include(Catch)

add_test(NAME Tests COMMAND threads_tests WORKING_DIRECTORY ${GXZN_THRDS_ROOT}/bin)
