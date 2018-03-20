contract Helper {
	function sel(uint a, bool select, uint b) returns (uint c) {
		if (select) return a; else return b;
	}
}
contract Main {
	Helper h;
	function callHelper(uint a, bool select, uint b) returns (uint c) {
		return h.sel(a, select, b) * 3;
	}
	function getHelper() returns (address haddress) {
		return address(h);
	}
	function setHelper(address haddress) {
		h = Helper(haddress);
	}
}

