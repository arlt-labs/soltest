contract Helper {
	function getAddress() returns (address addr) {
		return address(this);
	}
}
contract Main {
	Helper h;
	function callHelper() returns (address addr) {
		return h.getAddress();
	}
	function getHelper() returns (address addr) {
		return address(h);
	}
	function setHelper(address addr) {
		h = Helper(addr);
	}
}

