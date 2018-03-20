/// @ext:soltest
/// {arrays_in_constructors}
///     // compileAndRun(sourceCode, 0, "Creator");
///     // vector<u256> s1{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
///     // bytes dyn1 = encodeArgs(u256(s1.size()), s1);
///     // u256 x = 7;
///     // bytes args1 = encodeArgs(x, u256(0x40)) + dyn1;
///     // BOOST_REQUIRE(
///     // 	callContractFunction("f(uint256,address[])", asString(args1)) ==
///     // 	encodeArgs(x, s1[unsigned(x)])
///     // );
contract Base {
	uint public m_x;
	address[] m_s;
	function Base(uint x, address[] s) {
		m_x = x;
		m_s = s;
	}
	function part(uint i) returns (address) {
		return m_s[i];
	}
}
contract Main is Base {
	function Main(address[] s, uint x) Base(x, f(s)) {}
	function f(address[] s) returns (address[]) {
		return s;
	}
}
contract Creator {
	function f(uint x, address[] s) returns (uint r, address ch) {
		var c = new Main(s, x);
		r = c.m_x();
		ch = c.part(x);
	}
}

