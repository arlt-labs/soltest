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

