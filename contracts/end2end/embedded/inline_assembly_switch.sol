/// @ext:soltest
/// {inline_assembly_switch}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(0)), encodeArgs(u256(2)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(1)), encodeArgs(u256(8)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(2)), encodeArgs(u256(9)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(3)), encodeArgs(u256(2)));
contract C {
	function f(uint a) returns (uint b) {
		assembly {
			switch a
			case 1 { b := 8 }
			case 2 { b := 9 }
			default { b := 2 }
		}
	}
}

