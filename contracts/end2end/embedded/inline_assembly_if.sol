/// @ext:soltest
/// {inline_assembly_if}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(0)), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(1)), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(2)), encodeArgs(u256(2)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(3)), encodeArgs(u256(2)));
contract C {
	function f(uint a) returns (uint b) {
		assembly {
			if gt(a, 1) { b := 2 }
		}
	}
}

