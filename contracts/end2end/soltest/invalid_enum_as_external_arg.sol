contract C {
	enum X { A, B }

	function tested (X x) returns (uint) {
		return 1;
	}

	function test() returns (uint) {
		X garbled;

		assembly {
			garbled := 5
		}

		return this.tested(garbled);
	}
}

