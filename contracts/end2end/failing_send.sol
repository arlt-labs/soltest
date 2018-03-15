contract Helper {
	uint[] data;
	function () {
		data[9]; // trigger exception
	}
}
contract Main {
	function Main() payable {}
	function callHelper(address _a) returns (bool r, uint bal) {
		r = !_a.send(5);
		bal = this.balance;
	}
}

