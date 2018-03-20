/// @ext:soltest
/// {function_modifier}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getOne()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunctionWithValue("getOne()", 1), encodeArgs(1));
contract C {
	function getOne() payable nonFree returns (uint r) { return 1; }
	modifier nonFree { if (msg.value > 0) _; }
}

