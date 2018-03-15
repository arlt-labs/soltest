contract test {
	function a(bytes32 input) returns (bytes32 sha256hash) {
		return ripemd160(input);
	}
}

