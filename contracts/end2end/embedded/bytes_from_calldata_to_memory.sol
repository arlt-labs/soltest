/// @ext:soltest
/// {bytes_from_calldata_to_memory}
///     // compileAndRun(sourceCode);
///     // bytes calldata1 = FixedHash<4>(dev::keccak256("f()")).asBytes() + bytes(61, 0x22) + bytes(12, 0x12);
///     // sendMessage(calldata1, false);
///     // BOOST_CHECK(m_output == encodeArgs(dev::keccak256(bytes{'a', 'b', 'c'} + calldata1)));
contract C {
	function f() returns (bytes32) {
		return keccak256("abc", msg.data);
	}
}

