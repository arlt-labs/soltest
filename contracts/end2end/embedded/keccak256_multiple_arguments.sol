/// @ext:soltest
/// {keccak256_multiple_arguments}
///     // compileAndRun(sourceCode);
///     //
///     // ABI_CHECK(callContractFunction("foo(uint256,uint256,uint256)", 10, 12, 13), encodeArgs(
///     // 	dev::keccak256(
///     // 		toBigEndian(u256(10)) +
///     // 		toBigEndian(u256(12)) +
///     // 		toBigEndian(u256(13))
///     // 	)
///     // ));
contract c {
	function foo(uint a, uint b, uint c) returns (bytes32 d)
	{
		d = keccak256(a, b, c);
	}
}

