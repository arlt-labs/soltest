library D { function length(string memory self) returns (uint) { return bytes(self).length; } }
contract C {
	using D for string;
	string x;
	function f() returns (uint) {
		x = "abc";
		return x.length();
	}
	function g() returns (uint) {
		string memory s = "abc";
		return s.length();
	}
}

