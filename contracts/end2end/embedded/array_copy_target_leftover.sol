/// @ext:soltest
/// {array_copy_target_leftover}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(
///     // 	u256("0xffffffff"),
///     // 	asString(fromHex("0000000000000000""000000000a000900""0800070006000500""0400030002000100")),
///     // 	asString(fromHex("0000000000000000""0000000000000000""0000000000000000""0000000000000000"))
///     // ));
contract c {
	byte[10] data1;
	bytes2[32] data2;
	function test() returns (uint check, uint res1, uint res2) {
		uint i;
		for (i = 0; i < data2.length; ++i)
			data2[i] = 0xffff;
		check = uint(data2[31]) * 0x10000 | uint(data2[14]);
		for (i = 0; i < data1.length; ++i)
			data1[i] = byte(uint8(1 + i));
		data2 = data1;
		for (i = 0; i < 16; ++i)
			res1 |= uint(data2[i]) * 0x10000**i;
		for (i = 0; i < 16; ++i)
			res2 |= uint(data2[16 + i]) * 0x10000**i;
	}
}

