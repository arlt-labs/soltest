/// @ext:soltest
/// {keccak256_multiple_arguments_with_string_literals}
///     // compileAndRun(sourceCode);
///     //
///     // ABI_CHECK(callContractFunction("foo()"), encodeArgs(dev::keccak256("foo")));
///     //
///     // ABI_CHECK(callContractFunction("bar(uint256,uint16)", 10, 12), encodeArgs(
///     // 	dev::keccak256(
///     // 		toBigEndian(u256(10)) +
///     // 		bytes{0x0, 0xc} +
///     // 		bytes(1, 0x91) +
///     // 		bytes{0x66, 0x6f, 0x6f}
///     // 	)
///     // ));
contract c {
	function foo() returns (bytes32 d)
	{
		d = keccak256("foo");
	}
	function bar(uint a, uint16 b) returns (bytes32 d)
	{
		d = keccak256(a, b, 145, "foo");
	}
}

