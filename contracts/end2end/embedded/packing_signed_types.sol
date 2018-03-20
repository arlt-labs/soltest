/// @ext:soltest
/// {packing_signed_types}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("run()"),
///     // 	fromHex("fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffa")
///     // );
contract test {
	function run() returns(int8 y) {
		uint8 x = 0xfa;
		return int8(x);
	}
}

