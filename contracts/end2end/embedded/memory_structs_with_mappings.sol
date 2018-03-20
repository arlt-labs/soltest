/// @ext:soltest
/// {memory_structs_with_mappings}
///     // compileAndRun(sourceCode, 0, "Test");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0)));
contract Test {
	struct S { uint8 a; mapping(uint => uint) b; uint8 c; }
	S s;
	function f() returns (uint) {
		S memory x;
		if (x.a != 0 || x.c != 0) return 1;
		x.a = 4; x.c = 5;
		s = x;
		if (s.a != 4 || s.c != 5) return 2;
		x = S(2, 3);
		if (x.a != 2 || x.c != 3) return 3;
		x = s;
		if (s.a != 4 || s.c != 5) return 4;
	}
}

