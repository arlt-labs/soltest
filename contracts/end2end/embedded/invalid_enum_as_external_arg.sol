/// @ext:soltest
/// {invalid_enum_as_external_arg}
///     // compileAndRun(sourceCode, 0, "C");
///     // // should throw
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs());
contract C {
	enum X { A, B }

	function tested (X x) returns (uint) {
		return 1;
	}

	function test() returns (uint) {
		X garbled;

		assembly {
			garbled := 5
		}

		return this.tested(garbled);
	}
}

