/// @ext:soltest
/// {keccak256_multiple_arguments_with_numeric_literals}
///     // compileAndRun(sourceCode);
///     //
///     // ABI_CHECK(callContractFunction("foo(uint256,uint16)", 10, 12), encodeArgs(
///     // 	dev::keccak256(
///     // 		toBigEndian(u256(10)) +
///     // 		bytes{0x0, 0xc} +
///     // 		bytes(1, 0x91)
///     // 	)
///     // ));
contract c {
	function foo(uint a, uint16 b) returns (bytes32 d)
	{
		d = keccak256(a, b, 145);
	}
}

