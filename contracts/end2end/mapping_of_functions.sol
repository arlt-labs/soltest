contract Flow {
	bool public success;

	mapping (address => function () internal) stages;

	function stage0() internal {
		stages[msg.sender] = stage1;
	}

	function stage1() internal {
		stages[msg.sender] = stage2;
	}

	function stage2() internal {
		success = true;
	}

	function Flow() {
		stages[msg.sender] = stage0;
	}

	function f() returns (uint) {
		stages[msg.sender]();
		return 7;
	}
}

