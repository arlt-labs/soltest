contract C {
	bytes constant a = "\x03\x01\x02";
	bytes constant b = hex"030102";
	string constant c = "hello";
	function f() returns (bytes) {
		return a;
	}
	function g() returns (bytes) {
		return b;
	}
	function h() returns (bytes) {
		return bytes(c);
	}
}

