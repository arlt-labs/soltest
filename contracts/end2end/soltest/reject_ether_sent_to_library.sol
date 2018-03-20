library lib {}
contract c {
	function c() payable {}
	function f(address x) returns (bool) {
		return x.send(1);
	}
	function () payable {}
}

