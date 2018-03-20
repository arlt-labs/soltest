/// @ext:soltest
/// {same_function_in_construction_and_runtime}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("runtime(uint256)", encodeArgs(u256(3))), encodeArgs(u256(6)));
///     // ABI_CHECK(callContractFunction("initial()"), encodeArgs(u256(4)));
contract C {
	uint public initial;
	function C() {
		initial = double(2);
	}
	function double(uint _arg) returns (uint _ret) {
		_ret = _arg * 2;
	}
	function runtime(uint _arg) returns (uint) {
		return double(_arg);
	}
}

