/// @ext:soltest
/// {function_types_sig}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(asString(FixedHash<4>(dev::keccak256("f()")).asBytes())));
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(asString(FixedHash<4>(dev::keccak256("f()")).asBytes())));
///     // ABI_CHECK(callContractFunction("h()"), encodeArgs(asString(FixedHash<4>(dev::keccak256("f()")).asBytes())));
///     // ABI_CHECK(callContractFunction("i()"), encodeArgs(asString(FixedHash<4>(dev::keccak256("x()")).asBytes())));
contract C {
	uint public x;
	function f() pure returns (bytes4) {
		return this.f.selector;
	}
	function g() returns (bytes4) {
		function () pure external returns (bytes4) fun = this.f;
		return fun.selector;
	}
	function h() returns (bytes4) {
		function () pure external returns (bytes4) fun = this.f;
		var funvar = fun;
		return funvar.selector;
	}
	function i() pure returns (bytes4) {
		return this.x.selector;
	}
}

