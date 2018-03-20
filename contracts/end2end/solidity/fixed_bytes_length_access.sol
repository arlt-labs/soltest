contract C {
	byte a;
	function f(bytes32 x) returns (uint, uint, uint) {
		return (x.length, bytes16(2).length, a.length + 7);
	}
}

