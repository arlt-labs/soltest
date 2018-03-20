/// @ext:soltest
/// {dynamic_out_of_bounds_array_access}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("length()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("get(uint256)", 3), bytes());
///     // ABI_CHECK(callContractFunction("enlarge(uint256)", 4), encodeArgs(4));
///     // ABI_CHECK(callContractFunction("length()"), encodeArgs(4));
///     // ABI_CHECK(callContractFunction("set(uint256,uint256)", 3, 4), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("get(uint256)", 3), encodeArgs(4));
///     // ABI_CHECK(callContractFunction("length()"), encodeArgs(4));
///     // ABI_CHECK(callContractFunction("set(uint256,uint256)", 4, 8), bytes());
///     // ABI_CHECK(callContractFunction("length()"), encodeArgs(4));
contract c {
	uint[] data;
	function enlarge(uint amount) returns (uint) { return data.length += amount; }
	function set(uint index, uint value) returns (bool) { data[index] = value; return true; }
	function get(uint index) returns (uint) { return data[index]; }
	function length() returns (uint) { return data.length; }
}

