/// @ext:soltest
/// {bytes_index_access_memory}
///     // compileAndRun(sourceCode, 0, "Main");
///     // string s1("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz");
///     // bytes dyn1 = encodeArgs(u256(s1.length()), s1);
///     // bytes args1 = encodeArgs(u256(0x80), u256(3), u256(4), u256(5)) + dyn1;
///     // BOOST_REQUIRE(
///     // 	callContractFunction("f(bytes,uint256,uint256,uint256)", asString(args1)) ==
///     // 	encodeArgs(string{s1[3]}, string{s1[4]}, string{s1[5]})
///     // );
contract Main {
	function f(bytes _s1, uint i1, uint i2, uint i3) returns (byte c1, byte c2, byte c3) {
		c1 = _s1[i1];
		c2 = intern(_s1, i2);
		c3 = internIndirect(_s1)[i3];
	}
	function intern(bytes _s1, uint i) returns (byte c) {
		return _s1[i];
	}
	function internIndirect(bytes _s1) returns (bytes) {
		return _s1;
	}
}

