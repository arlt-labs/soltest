/// @ext:soltest
/// {complex_accessors}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("to_string_map(uint256)", 42), encodeArgs("24"));
///     // ABI_CHECK(callContractFunction("to_bool_map(uint256)", 42), encodeArgs(false));
///     // ABI_CHECK(callContractFunction("to_uint_map(uint256)", 42), encodeArgs(12));
///     // ABI_CHECK(callContractFunction("to_multiple_map(uint256,uint256)", 42, 23), encodeArgs(31));
contract test {
	mapping(uint256 => bytes4) public to_string_map;
	mapping(uint256 => bool) public to_bool_map;
	mapping(uint256 => uint256) public to_uint_map;
	mapping(uint256 => mapping(uint256 => uint256)) public to_multiple_map;
	function test() {
		to_string_map[42] = "24";
		to_bool_map[42] = false;
		to_uint_map[42] = 12;
		to_multiple_map[42][23] = 31;
	}
}

