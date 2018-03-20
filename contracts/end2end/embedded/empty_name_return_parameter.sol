/// @ext:soltest
/// {empty_name_return_parameter}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(uint256)", 9), encodeArgs(9));
contract test {
	function f(uint k) returns(uint){
		return k;
}
}

