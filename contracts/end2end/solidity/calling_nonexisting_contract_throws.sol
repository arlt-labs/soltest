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

