contract C {
	function f() returns (uint[200]) {}
}
contract D {
	function f(C c) returns (uint) { c.f(); return 7; }
}

