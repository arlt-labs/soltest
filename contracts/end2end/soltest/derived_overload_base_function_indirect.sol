contract A { function f(uint a) returns(uint) { return 2 * a; } }
contract B { function f() returns(uint) { return 10; } }
contract C is A, B {
	function g() returns(uint) { return f(); }
	function h() returns(uint) { return f(1); }
}

