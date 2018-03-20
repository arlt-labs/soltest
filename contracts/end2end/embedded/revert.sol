/// @ext:soltest
/// {revert}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(42)));
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(42)));
contract C {
	uint public a = 42;
	function f() {
		a = 1;
		revert();
	}
	function g() {
		a = 1;
		assembly {
			revert(0, 0)
		}
	}
}

