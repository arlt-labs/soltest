contract C {
	function f() returns (string, uint) {
		return ("abc", 8);
	}
	function g() returns (string, string) {
		return (h(), "def");
	}
	function h() returns (string) {
		return ("abc",);
	}
}

