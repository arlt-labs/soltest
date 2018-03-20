/// @ext:soltest
/// {memory_types_initialisation}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // ABI_CHECK(callContractFunction("stat()"), encodeArgs(vector<u256>(5)));
///     // ABI_CHECK(callContractFunction("dyn()"), encodeArgs(u256(0x20), u256(0)));
///     // ABI_CHECK(callContractFunction("nested()"), encodeArgs(u256(0x20), u256(0)));
///     // ABI_CHECK(callContractFunction("nestedStat()"), encodeArgs(vector<u256>(3 * 7)));
contract Test {
	mapping(uint=>uint) data;
	function stat() returns (uint[5])
	{
		data[2] = 3; // make sure to use some memory
	}
	function dyn() returns (uint[]) { stat(); }
	function nested() returns (uint[3][]) { stat(); }
	function nestedStat() returns (uint[3][7]) { stat(); }
}

