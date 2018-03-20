contract C {
	bytes32 public x;
	uint public a;
	function f(bytes32 _x, uint _a) {
		x = _x;
		a = _a;
	}
	function g() {
		this.f("", 2);
	}
}

