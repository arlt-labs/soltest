library D {
	struct s { uint a; }
	function mul(s storage self, uint x) returns (uint) { return self.a *= x; }
	function mul(s storage self, bytes32 x) returns (bytes32) { }
}
contract C {
	using D for D.s;
	D.s public x;
	function f(uint a) returns (uint) {
		x.a = 6;
		return x.mul(a);
	}
}
