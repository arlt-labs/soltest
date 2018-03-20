/// @ext:soltest
/// {function_modifier_for_constructor}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getData()"), encodeArgs(4 | 2));
contract A {
	uint data;
	function A() mod1 { data |= 2; }
	modifier mod1 { data |= 1; _; }
	function getData() returns (uint r) { return data; }
}
contract C is A {
	modifier mod1 { data |= 4; _; }
}

