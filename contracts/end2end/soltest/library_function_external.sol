library Lib { function m(bytes b) external pure returns (byte) { return b[2]; } }
contract Test {
	function f(bytes b) public pure returns (byte) {
		return Lib.m(b);
	}
}

