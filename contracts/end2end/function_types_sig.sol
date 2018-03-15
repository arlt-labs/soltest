contract C {
	uint public x;
	function f() pure returns (bytes4) {
		return this.f.selector;
	}
	function g() returns (bytes4) {
		function () pure external returns (bytes4) fun = this.f;
		return fun.selector;
	}
	function h() returns (bytes4) {
		function () pure external returns (bytes4) fun = this.f;
		var funvar = fun;
		return funvar.selector;
	}
	function i() pure returns (bytes4) {
		return this.x.selector;
	}
}

