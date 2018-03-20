	/// @ext:soltest
/// {enum_explicit_overflow}
///     // compileAndRun(sourceCode);
///     // // These should throw
///     // ABI_CHECK(callContractFunction("getChoiceExp(uint256)", 3), encodeArgs());
///     // ABI_CHECK(callContractFunction("getChoiceFromSigned(int256)", -1), encodeArgs());
///     // ABI_CHECK(callContractFunction("getChoiceFromNegativeLiteral()"), encodeArgs());
///     // // These should work
///     // ABI_CHECK(callContractFunction("getChoiceExp(uint256)", 2), encodeArgs(2));
///     // ABI_CHECK(callContractFunction("getChoiceExp(uint256)", 0), encodeArgs(0));
contract test {
		enum ActionChoices { GoLeft, GoRight, GoStraight }
		function test()
		{
		}
		function getChoiceExp(uint x) returns (uint d)
		{
			choice = ActionChoices(x);
			d = uint256(choice);
		}
		function getChoiceFromSigned(int x) returns (uint d)
		{
			choice = ActionChoices(x);
			d = uint256(choice);
		}
		function getChoiceFromNegativeLiteral() returns (uint d)
		{
			choice = ActionChoices(-1);
			d = uint256(choice);
		}
		ActionChoices choice;
	}

