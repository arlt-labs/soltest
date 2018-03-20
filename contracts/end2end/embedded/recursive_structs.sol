/// @ext:soltest
/// {recursive_structs}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(1)));
contract C {
	struct S {
		S[] x;
	}
	S sstorage;
	function f() returns (uint) {
		S memory s;
		s.x = new S[](10);
		delete s;
		sstorage.x.length++;
		delete sstorage;
		return 1;
	}
}

