/// @ext:soltest
/// {return_bytes_internal}
///     // compileAndRun(sourceCode, 0, "Main");
///     // string s1("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz");
///     // vector<size_t> lengthes{0, 31, 64, 65};
///     // for (auto l1: lengthes)
///     // {
///     // 	bytes dyn1 = encodeArgs(u256(l1), s1.substr(0, l1));
///     // 	bytes args1 = encodeArgs(u256(0x20)) + dyn1;
///     // 	BOOST_REQUIRE(
///     // 		callContractFunction("set(bytes)", asString(args1)) ==
///     // 		encodeArgs(u256(l1), u256(0x40)) + dyn1
///     // 	);
///     // }
contract Main {
	bytes s1;
	function doSet(bytes _s1) returns (bytes _r1) {
		s1 = _s1;
		_r1 = s1;
	}
	function set(bytes _s1) external returns (uint _r, bytes _r1) {
		_r1 = doSet(_s1);
		_r = _r1.length;
	}
}

