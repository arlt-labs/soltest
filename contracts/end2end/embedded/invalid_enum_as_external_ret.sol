/// @ext:soltest
/// {invalid_enum_as_external_ret}
///     // compileAndRun(sourceCode, 0, "C");
///     // // both should throw
///     // ABI_CHECK(callContractFunction("test_return()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("test_inline_assignment()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("test_assignment()"), encodeArgs());
contract C {
	enum X { A, B }

	function test_return() returns (X) {
		X garbled;
		assembly {
			garbled := 5
		}
		return garbled;
	}
	function test_inline_assignment() returns (X _ret) {
		assembly {
			_ret := 5
		}
	}
	function test_assignment() returns (X _ret) {
		X tmp;
		assembly {
			tmp := 5
		}
		_ret = tmp;
	}
}

