/// @ext:soltest
/// {packed_keccak256}
///     // compileAndRun(sourceCode);
///     // auto f = [&](u256 const& _x) -> u256
///     // {
///     // 	return dev::keccak256(
///     // 		toCompactBigEndian(unsigned(8)) +
///     // 		toBigEndian(_x) +
///     // 		toCompactBigEndian(unsigned(65536)) +
///     // 		toBigEndian(_x) +
///     // 		toBigEndian(u256(256))
///     // 	);
///     // };
///     // testContractAgainstCpp("a(bytes32)", f, u256(4));
///     // testContractAgainstCpp("a(bytes32)", f, u256(5));
///     // testContractAgainstCpp("a(bytes32)", f, u256(-1));
contract test {
	function a(bytes32 input) returns (bytes32 hash) {
		var b = 65536;
		uint c = 256;
		return keccak256(8, input, b, input, c);
	}
}

