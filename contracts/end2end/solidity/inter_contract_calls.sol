contract Helper {
	function multiply(uint a, uint b) returns (uint c) {
		return a * b;
	}
}
contract Main {
	Helper h;
	function callHelper(uint a, uint b) returns (uint c) {
		return h.multiply(a, b);
	}
	function getHelper() returns (address haddress) {
		return address(h);
	}
	function setHelper(address haddress) {
		h = Helper(haddress);
	}
}

