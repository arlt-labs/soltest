library Utils {
	function reduce(uint[] memory array, function(uint, uint) returns (uint) f, uint init) internal returns (uint) {
		for (uint i = 0; i < array.length; i++) {
			init = f(array[i], init);
		}
		return init;
	}
	function sum(uint a, uint b) internal returns (uint) {
		return a + b;
	}
}
/// @ext:soltest
/// {function_type_library_internal}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256[])", 0x20, 3, u256(1), u256(7), u256(3)), encodeArgs(u256(11)));
contract C {
	function f(uint[] x) returns (uint) {
		return Utils.reduce(x, Utils.sum, 0);
	}
}

