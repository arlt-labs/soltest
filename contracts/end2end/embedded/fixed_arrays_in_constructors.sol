/// @ext:soltest
/// {fixed_arrays_in_constructors}
///     // compileAndRun(sourceCode, 0, "Creator", encodeArgs(u256(1), u256(2), u256(3), u256(4)));
///     // BOOST_REQUIRE(callContractFunction("r()") == encodeArgs(u256(4)));
///     // BOOST_REQUIRE(callContractFunction("ch()") == encodeArgs(u256(3)));
contract Creator {
	uint public r;
	address public ch;
	function Creator(address[3] s, uint x) {
		r = x;
		ch = s[2];
	}
}

