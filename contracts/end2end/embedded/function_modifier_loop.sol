/// @ext:soltest
/// {function_modifier_loop}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(10));
contract C {
	modifier repeat(uint count) { for (var i = 0; i < count; ++i) _; }
	function f() repeat(10) returns (uint r) { r += 1; }
}

