/// @ext:soltest
/// {array_copy_target_simple}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(
///     // 	asString(fromHex("0000000000000001")),
///     // 	asString(fromHex("0000000000000002")),
///     // 	asString(fromHex("0000000000000003")),
///     // 	asString(fromHex("0000000000000004")),
///     // 	asString(fromHex("0000000000000000"))
///     // ));
contract c {
	bytes8[9] data1; // 4 per slot
	bytes17[10] data2; // 1 per slot, no offset counter
	function test() returns (bytes17 a, bytes17 b, bytes17 c, bytes17 d, bytes17 e) {
		for (uint i = 0; i < data1.length; ++i)
			data1[i] = bytes8(i);
		data2[8] = data2[9] = 2;
		data2 = data1;
		a = data2[1];
		b = data2[2];
		c = data2[3];
		d = data2[4];
		e = data2[9];
	}
}

