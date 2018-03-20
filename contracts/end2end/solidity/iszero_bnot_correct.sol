contract C {
	function f() returns (bool) {
		bytes32 x = 1;
		assembly { x := not(x) }
		if (x != ~bytes32(1)) return false;
		assembly { x := iszero(x) }
		if (x != bytes32(0)) return false;
		return true;
	}
}

