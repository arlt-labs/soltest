contract C {
	function f() returns (bool) {
		return address(this.f) == address(this);
	}
	function g(function() external cb) returns (address) {
		return address(cb);
	}
}

