contract A {
	event Deposit();
}

contract B {
	event Deposit(address _addr);
}

contract ClientReceipt is A, B {
	event Deposit(address _addr, uint _amount);
	function deposit() returns (uint) {
		emit Deposit();
		return 1;
	}
	function deposit(address _addr) returns (uint) {
		emit Deposit(_addr);
		return 1;
	}
	function deposit(address _addr, uint _amount) returns (uint) {
		emit Deposit(_addr, _amount);
		return 1;
	}
}

