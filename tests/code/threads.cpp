
#include <catch2/catch_test_macros.hpp>
#include <catch2/benchmark/catch_benchmark.hpp>

#include <golxzn/os/threads.hpp>

TEST_CASE("Module names test", "[test][os][threads][names]") {
	REQUIRE(gxzn::os::get_module_name() == "os");
	REQUIRE(gxzn::os::get_submodule_name() == "threads");
	REQUIRE(gxzn::os::get_full_name() == "os::threads");
}
