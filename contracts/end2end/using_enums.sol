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

