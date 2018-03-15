contract A {
	function A() payable {}
	function a(address addr, uint amount) returns (uint) {
		addr.transfer(amount);
		return this.balance;
	}
	function b(address addr, uint amount) {
		addr.transfer(amount);
	}
}

contract B {
}

contract C {
	function () payable {
		throw;
	}
}

