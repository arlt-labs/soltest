/// @ext:soltest
/// {string_allocation_bug}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("p(uint256)", 0), encodeArgs(
///     // 	u256(0xbbbb),
///     // 	u256(0xcccc),
///     // 	u256(0x80),
///     // 	u256(0xc0),
///     // 	u256(5),
///     // 	string("hello"),
///     // 	u256(5),
///     // 	string("world")
///     // ));
contract Sample
{
	struct s { uint16 x; uint16 y; string a; string b;}
	s[2] public p;
	function Sample() {
		s memory m;
		m.x = 0xbbbb;
		m.y = 0xcccc;
		m.a = "hello";
		m.b = "world";
		p[0] = m;
	}
}

