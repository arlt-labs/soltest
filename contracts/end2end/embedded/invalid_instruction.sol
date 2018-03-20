/// @ext:soltest
/// {invalid_instruction}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs());
contract C {
	function f() {
		assembly {
			invalid
		}
	}
}

