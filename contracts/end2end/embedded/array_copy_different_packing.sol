/// @ext:soltest
/// {array_copy_different_packing}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(
///     // 	asString(fromHex("0000000000000001")),
///     // 	asString(fromHex("0000000000000002")),
///     // 	asString(fromHex("0000000000000003")),
///     // 	asString(fromHex("0000000000000004")),
///     // 	asString(fromHex("0000000000000005"))
///     // ));
contract c {
	bytes8[] data1; // 4 per slot
	bytes10[] data2; // 3 per slot
	function test() returns (bytes10 a, bytes10 b, bytes10 c, bytes10 d, bytes10 e) {
		data1.length = 9;
		for (uint i = 0; i < data1.length; ++i)
			data1[i] = bytes8(i);
		data2 = data1;
		a = data2[1];
		b = data2[2];
		c = data2[3];
		d = data2[4];
		e = data2[5];
	}
}

