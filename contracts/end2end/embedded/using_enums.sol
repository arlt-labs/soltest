	/// @ext:soltest
/// {using_enums}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getChoice()"), encodeArgs(2));
contract test {
		enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
		function test()
		{
			choices = ActionChoices.GoStraight;
		}
		function getChoice() returns (uint d)
		{
			d = uint256(choices);
		}
		ActionChoices choices;
	}

