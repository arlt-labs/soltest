/// @ext:soltest
/// {decayed_tuple}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(2)));
contract C {
	function f() returns (uint) {
		uint x = 1;
		(x) = 2;
		return x;
	}
}

