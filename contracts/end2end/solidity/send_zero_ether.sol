contract Receiver {
	function () payable {
	}
}
contract Main {
	function Main() payable {}
	function s() returns (bool) {
		var r = new Receiver();
		return r.send(0);
	}
}

