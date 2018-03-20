/// @ext:soltest
/// {inline_assembly_read_and_write_stack}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(45)));
contract C {
	function f() returns (uint r) {
		for (uint x = 0; x < 10; ++x)
			assembly { r := add(r, x) }
	}
}

