interface I {
	event A();
	function f() returns (bool);
	function() payable;
}

contract A is I {
	function f() returns (bool) {
		return g();
	}

	function g() returns (bool) {
		return true;
	}

	function() payable {
	}
}

contract C {
	function f(address _interfaceAddress) returns (bool) {
		I i = I(_interfaceAddress);
		return i.f();
	}
}

