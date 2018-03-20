/// @ext:soltest
/// {array_copy_storage_storage_static_dynamic}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(9, 4));
contract c {
	uint[9] data1;
	uint[] data2;
	function test() returns (uint x, uint y){
		data1[8] = 4;
		data2 = data1;
		x = data2.length;
		y = data2[8];
	}
}

