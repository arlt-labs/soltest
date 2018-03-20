/// @ext:soltest
/// {calling_nonexisting_contract_throws}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("h()"), encodeArgs(u256(7)));
contract D { function g(); }
contract C {
	D d = D(0x1212);
	function f() returns (uint) {
		d.g();
		return 7;
	}
	function g() returns (uint) {
		d.g.gas(200)();
		return 7;
	}
	function h() returns (uint) {
		d.call(); // this does not throw (low-level)
		return 7;
	}
}

