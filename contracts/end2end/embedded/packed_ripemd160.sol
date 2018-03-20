/// @ext:soltest
/// {packed_ripemd160}
///     // compileAndRun(sourceCode);
///     // auto f = [&](u256 const& _x) -> bytes
///     // {
///     // 	if (_x == u256(4))
///     // 		return fromHex("f93175303eba2a7b372174fc9330237f5ad202fc000000000000000000000000");
///     // 	if (_x == u256(5))
///     // 		return fromHex("04f4fc112e2bfbe0d38f896a46629e08e2fcfad5000000000000000000000000");
///     // 	if (_x == u256(-1))
///     // 		return fromHex("c0a2e4b1f3ff766a9a0089e7a410391730872495000000000000000000000000");
///     // 	return fromHex("");
///     // };
///     // testContractAgainstCpp("a(bytes32)", f, u256(4));
///     // testContractAgainstCpp("a(bytes32)", f, u256(5));
///     // testContractAgainstCpp("a(bytes32)", f, u256(-1));
contract test {
	function a(bytes32 input) returns (bytes32 hash) {
		var b = 65536;
		uint c = 256;
		return ripemd160(8, input, b, input, c);
	}
}

