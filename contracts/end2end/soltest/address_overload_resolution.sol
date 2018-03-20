contract C {
	function balance() returns (uint) {
		return 1;
	}
	function transfer(uint amount) returns (uint) {
		return amount;
	}
}
contract D {
	function f() returns (uint) {
		return (new C()).balance();
	}
	function g() returns (uint) {
		return (new C()).transfer(5);
	}
}

