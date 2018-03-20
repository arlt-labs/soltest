/// @ext:soltest
/// {store_function_in_constructor}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("use(uint256)", encodeArgs(u256(3))), encodeArgs(u256(6)));
///     // ABI_CHECK(callContractFunction("result_in_constructor()"), encodeArgs(u256(4)));
contract C {
	uint public result_in_constructor;
	function (uint) internal returns (uint) x;
	function C () {
		x = double;
		result_in_constructor = use(2);
	}
	function double(uint _arg) returns (uint _ret) {
		_ret = _arg * 2;
	}
	function use(uint _arg) returns (uint) {
		return x(_arg);
	}
}

