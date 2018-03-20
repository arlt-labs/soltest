/// @ext:soltest
/// {invalid_enum_stored}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test_store_ok()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(0)));
///     //
///     // // should throw
///     // ABI_CHECK(callContractFunction("test_store()"), encodeArgs());
contract C {
	enum X { A, B }
	X public x;

	function test_store() returns (uint) {
		X garbled = X.A;
		assembly {
			garbled := 5
		}
		x = garbled;
		return 1;
	}
	function test_store_ok() returns (uint) {
		x = X.A;
		return 1;
	}
}

