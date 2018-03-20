/// @ext:soltest
/// {inline_assembly_write_to_stack}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(7), string("abcdef")));
contract C {
	function f() returns (uint r, bytes32 r2) {
		assembly { r := 7 r2 := "abcdef" }
	}
}

