/// @ext:soltest
/// {function_modifier_overriding}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(false));
contract A {
	function f() mod returns (bool r) { return true; }
	modifier mod { _; }
}
contract C is A {
	modifier mod { if (false) _; }
}

