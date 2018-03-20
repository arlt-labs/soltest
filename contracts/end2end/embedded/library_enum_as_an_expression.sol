library Arst {
	enum Foo {
		Things,
		Stuff
	}
}

/// @ext:soltest
/// {library_enum_as_an_expression}
///     // compileAndRun(sourceCode, 0, "Tsra");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(1)));
contract Tsra {
	function f() returns(uint) {
		Arst.Foo;
		return 1;
	}
}

