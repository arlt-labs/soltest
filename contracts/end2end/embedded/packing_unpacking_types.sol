/// @ext:soltest
/// {packing_unpacking_types}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("run(bool,uint32,uint64)", true, fromHex("0f0f0f0f"), fromHex("f0f0f0f0f0f0f0f0")),
///     // 	fromHex("00000000000000000000000000000000000000""01""f0f0f0f0""0f0f0f0f0f0f0f0f")
///     // );
contract test {
	function run(bool a, uint32 b, uint64 c) returns(uint256 y) {
		if (a) y = 1;
		y = y * 0x100000000 | ~b;
		y = y * 0x10000000000000000 | ~c;
	}
}

