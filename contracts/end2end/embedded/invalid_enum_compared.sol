/// @ext:soltest
/// {invalid_enum_compared}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test_eq_ok()"), encodeArgs(u256(1)));
///     // // both should throw
///     // ABI_CHECK(callContractFunction("test_eq()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("test_neq()"), encodeArgs());
contract C {
	enum X { A, B }

	function test_eq() returns (bool) {
		X garbled;
		assembly {
			garbled := 5
		}
		return garbled == garbled;
	}
	function test_eq_ok() returns (bool) {
		X garbled = X.A;
		return garbled == garbled;
	}
	function test_neq() returns (bool) {
		X garbled;
		assembly {
			garbled := 5
		}
		return garbled != garbled;
	}
}

