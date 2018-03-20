/// @ext:soltest
/// {struct_constructor_nested}
///     // compileAndRun(sourceCode, 0, "C");
///     //
///     // auto out = encodeArgs(u256(1), u256(0), u256(9), u256(0), u256(4), u256(5));
///     // ABI_CHECK(callContractFunction("get()"), out);
contract C {
	struct X { uint x1; uint x2; }
	struct S { uint s1; uint[3] s2; X s3; }
	S s;
	function C() {
		uint[3] memory s2;
		s2[1] = 9;
		s = S(1, s2, X(4, 5));
	}
	function get() returns (uint s1, uint[3] s2, uint x1, uint x2)
	{
		s1 = s.s1;
		s2 = s.s2;
		x1 = s.s3.x1;
		x2 = s.s3.x2;
	}
}

