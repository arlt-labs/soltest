/// @ext:soltest
/// {array_copy_storage_storage_static_static}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(8, 0));
contract c {
	uint[40] data1;
	uint[20] data2;
	function test() returns (uint x, uint y){
		data1[30] = 4;
		data1[2] = 7;
		data1[3] = 9;
		data2[3] = 8;
		data1 = data2;
		x = data1[3];
		y = data1[30]; // should be cleared
	}
}

