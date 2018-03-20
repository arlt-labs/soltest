/// @ext:soltest
/// {same_function_in_construction_and_runtime_equality_check}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(true));
contract C {
	function (uint) internal returns (uint) x;
	function C() {
		x = double;
	}
	function test() returns (bool) {
		return x == double;
	}
	function double(uint _arg) returns (uint _ret) {
		_ret = _arg * 2;
	}
}

