/// @ext:soltest
/// {bytes_memory_index_access}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // string data("abcdefgh");
///     // BOOST_REQUIRE(callContractFunction(
///     // 		"set(bytes,uint256)",
///     // 		u256(0x40),
///     // 		u256(3),
///     // 		u256(data.size()),
///     // 		data
///     // ) == encodeArgs(u256(data.size()), string("d")));
contract Test {
	function set(bytes _data, uint i) returns (uint l, byte c) {
		l = _data.length;
		c = _data[i];
	}
}

