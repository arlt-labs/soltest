/// @ext:soltest
/// {inline_assembly_in_modifiers}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(true));
contract C {
	modifier m {
		uint a = 1;
		assembly {
			a := 2
		}
		if (a != 2)
			throw;
		_;
	}
	function f() m returns (bool) {
		return true;
	}
}

