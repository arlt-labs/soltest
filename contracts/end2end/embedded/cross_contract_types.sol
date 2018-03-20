/// @ext:soltest
/// {cross_contract_types}
///     // compileAndRun(sourceCode, 0, "Test");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(3)));
contract Lib { struct S {uint a; uint b; } }
contract Test {
	function f() returns (uint r) {
		var x = Lib.S({a: 2, b: 3});
		r = x.b;
	}
}

