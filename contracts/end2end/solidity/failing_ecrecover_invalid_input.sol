contract C {
	function f() returns (address) {
		return ecrecover(bytes32(uint(-1)), 1, 2, 3);
	}
}

