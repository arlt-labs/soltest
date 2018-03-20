pragma experimental ABIEncoderV2;
/// @ext:soltest
/// {array_copy_storage_abi}
///     // compileAndRun(sourceCode);
///     // bytes valueSequence;
///     // for (size_t i = 0; i < 101; ++i)
///     // 	valueSequence += toBigEndian(u256(i));
///     // ABI_CHECK(callContractFunction("test1()"), encodeArgs(0x20, 101) + valueSequence);
///     // ABI_CHECK(callContractFunction("test2()"), encodeArgs(0x20, 101) + valueSequence);
///     // ABI_CHECK(callContractFunction("test3()"), encodeArgs(0x20, 101) + valueSequence);
///     // ABI_CHECK(callContractFunction("test4()"),
///     // 	encodeArgs(0x20, 5, 0xa0, 0xa0 + 102 * 32 * 1, 0xa0 + 102 * 32 * 2, 0xa0 + 102 * 32 * 3, 0xa0 + 102 * 32 * 4) +
///     // 	encodeArgs(101) + valueSequence +
///     // 	encodeArgs(101) + valueSequence +
///     // 	encodeArgs(101) + valueSequence +
///     // 	encodeArgs(101) + valueSequence +
///     // 	encodeArgs(101) + valueSequence
///     // );
contract c {
	uint8[] x;
	uint16[] y;
	uint24[] z;
	uint24[][] w;
	function test1() returns (uint8[]) {
		for (uint i = 0; i < 101; ++i)
			x.push(uint8(i));
		return x;
	}
	function test2() returns (uint16[]) {
		for (uint i = 0; i < 101; ++i)
			y.push(uint16(i));
		return y;
	}
	function test3() returns (uint24[]) {
		for (uint i = 0; i < 101; ++i)
			z.push(uint24(i));
		return z;
	}
	function test4() returns (uint24[][]) {
		w.length = 5;
		for (uint i = 0; i < 5; ++i)
			for (uint j = 0; j < 101; ++j)
				w[i].push(uint24(j));
		return w;
	}
}

