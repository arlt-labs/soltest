/// @ext:soltest
/// {fixed_out_of_bounds_array_access}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("length()"), encodeArgs(4));
///     // ABI_CHECK(callContractFunction("set(uint256,uint256)", 3, 4), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("set(uint256,uint256)", 4, 5), bytes());
///     // ABI_CHECK(callContractFunction("set(uint256,uint256)", 400, 5), bytes());
///     // ABI_CHECK(callContractFunction("get(uint256)", 3), encodeArgs(4));
///     // ABI_CHECK(callContractFunction("get(uint256)", 4), bytes());
///     // ABI_CHECK(callContractFunction("get(uint256)", 400), bytes());
///     // ABI_CHECK(callContractFunction("length()"), encodeArgs(4));
contract c {
	uint[4] data;
	function set(uint index, uint value) returns (bool) { data[index] = value; return true; }
	function get(uint index) returns (uint) { return data[index]; }
	function length() returns (uint) { return data.length; }
}

