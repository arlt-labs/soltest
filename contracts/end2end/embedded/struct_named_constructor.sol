/// @ext:soltest
/// {struct_named_constructor}
///     // compileAndRun(sourceCode, 0, "C");
///     //
///     // ABI_CHECK(callContractFunction("s()"), encodeArgs(u256(1), true));
contract C {
	struct S { uint a; bool x; }
	S public s;
	function C() {
		s = S({a: 1, x: true});
	}
}

