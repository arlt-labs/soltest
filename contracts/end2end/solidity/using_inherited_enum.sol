	contract base {
		enum Choice { A, B, C }
	}

	contract test is base {
		function answer () returns (Choice _ret)
		{
			_ret = Choice.B;
		}
	}

