contract B { function f() returns(uint) { return 10; } }
contract C is B {
	function f(uint i) returns(uint) { return 2 * i; }
	function g() returns(uint) { return f(1); }
}

