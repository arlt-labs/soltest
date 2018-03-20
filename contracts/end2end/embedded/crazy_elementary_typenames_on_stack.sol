/// @ext:soltest
/// {crazy_elementary_typenames_on_stack}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(-7)));
contract C {
	function f() returns (uint r) {
		uint; uint; uint; uint;
		int x = -7;
		var a = uint;
		return a(x);
	}
}

