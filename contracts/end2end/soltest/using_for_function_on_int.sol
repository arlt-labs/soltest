library D { function double(uint self) returns (uint) { return 2*self; } }
contract C {
	using D for uint;
	function f(uint a) returns (uint) {
		return a.double();
	}
}

