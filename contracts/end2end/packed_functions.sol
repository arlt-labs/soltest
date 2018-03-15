contract C {
	// these should take the same slot
	function() returns (uint) a;
	function() external returns (uint) b;
	function() external returns (uint) c;
	function() returns (uint) d;
	uint8 public x;

	function set() {
		x = 2;
		d = g;
		c = this.h;
		b = this.h;
		a = g;
	}
	function t1() returns (uint) {
		return a();
	}
	function t2() returns (uint) {
		return b();
	}
	function t3() returns (uint) {
		return a();
	}
	function t4() returns (uint) {
		return b();
	}
	function g() returns (uint) {
		return 7;
	}
	function h() returns (uint) {
		return 8;
	}
}

