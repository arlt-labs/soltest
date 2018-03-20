contract Base {
	function f() returns (uint i) { return g(); }
	function g() returns (uint i) { return 1; }
}
contract Derived is Base {
	function g() returns (uint i) { return 2; }
}

