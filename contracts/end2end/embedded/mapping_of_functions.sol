/// @ext:soltest
/// {mapping_of_functions}
///     //
///     // compileAndRun(sourceCode, 0, "Flow");
///     // ABI_CHECK(callContractFunction("success()"), encodeArgs(false));
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("success()"), encodeArgs(false));
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("success()"), encodeArgs(true));
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

