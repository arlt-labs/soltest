/// @ext:soltest
/// {calldata_offset}
///     // compileAndRun(sourceCode, 0, "CB", encodeArgs(u256(0x20)));
///     // ABI_CHECK(callContractFunction("last()", encodeArgs()), encodeDyn(string("nd")));
contract CB
{
	address[] _arr;
	string public last = "nd";
	function CB(address[] guardians)
	{
		_arr = guardians;
	}
}

