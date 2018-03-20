contract A { function f(uint a) returns(uint) { return 2 * a; } }
contract B { function f(bool b) returns(uint) { return 10; } }
contract C is A, B {
	function g() returns(uint) { return super.f(true); }
	function h() returns(uint) { return super.f(1); }
}

