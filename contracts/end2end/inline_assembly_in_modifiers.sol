contract C {
	modifier m {
		uint a = 1;
		assembly {
			a := 2
		}
		if (a != 2)
			throw;
		_;
	}
	function f() m returns (bool) {
		return true;
	}
}

