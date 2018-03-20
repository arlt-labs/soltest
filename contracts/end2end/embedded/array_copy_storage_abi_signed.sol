/// @ext:soltest
/// {array_copy_storage_abi_signed}
///     // compileAndRun(sourceCode);
///     // bytes valueSequence;
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(0x20, 8,
///     // 	u256(-1),
///     // 	u256(-1),
///     // 	u256(8),
///     // 	u256(-16),
///     // 	u256(-2),
///     // 	u256(6),
///     // 	u256(8),
///     // 	u256(-1)
///     // ));
contract c {
	int16[] x;
	function test() returns (int16[]) {
		x.push(int16(-1));
		x.push(int16(-1));
		x.push(int16(8));
		x.push(int16(-16));
		x.push(int16(-2));
		x.push(int16(6));
		x.push(int16(8));
		x.push(int16(-1));
		return x;
	}
}

