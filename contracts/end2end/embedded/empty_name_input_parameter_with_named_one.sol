/// @ext:soltest
/// {empty_name_input_parameter_with_named_one}
///     // compileAndRun(sourceCode);
///     // BOOST_CHECK(callContractFunction("f(uint256,uint256)", 5, 9) != encodeArgs(5, 8));
///     // ABI_CHECK(callContractFunction("f(uint256,uint256)", 5, 9), encodeArgs(9, 8));
contract test {
	function f(uint, uint k) returns(uint ret_k, uint ret_g){
		uint g = 8;
		ret_k = k;
		ret_g = g;
	}
}

