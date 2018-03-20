/// @ext:soltest
/// {explicit_base_class}
///     // compileAndRun(sourceCode, 0, "Derived");
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(3));
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(1));
contract BaseBase { function g() returns (uint r) { return 1; } }
contract Base is BaseBase { function g() returns (uint r) { return 2; } }
contract Derived is Base {
	function f() returns (uint r) { return BaseBase.g(); }
	function g() returns (uint r) { return 3; }
}

