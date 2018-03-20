contract Helper {
	function invoke(bytes3 x, bool stop) returns (bytes4 ret) {
		return x;
	}
}
contract Main {
	Helper h;
	function callHelper(bytes2 x, bool stop) returns (bytes5 ret) {
		return h.invoke(x, stop);
	}
	function getHelper() returns (address addr) {
		return address(h);
	}
	function setHelper(address addr) {
		h = Helper(addr);
	}
}

