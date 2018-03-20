contract C {
	function f(uint a) returns (uint b) {
		assembly {
			if gt(a, 1) { b := 2 }
		}
	}
}

