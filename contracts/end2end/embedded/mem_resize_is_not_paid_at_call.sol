/// @ext:soltest
/// {mem_resize_is_not_paid_at_call}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // u160 cAddr = m_contractAddress;
///     // compileAndRun(sourceCode, 0, "D");
///     // ABI_CHECK(callContractFunction("f(address)", cAddr), encodeArgs(u256(7)));
contract C {
	function f() returns (uint[200]) {}
}
contract D {
	function f(C c) returns (uint) { c.f(); return 7; }
}

