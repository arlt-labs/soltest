	/// @ext:soltest
/// {using_inherited_enum}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("answer()"), encodeArgs(1));
contract base {
		enum Choice { A, B, C }
	}

	contract test is base {
		function answer () returns (Choice _ret)
		{
			_ret = Choice.B;
		}
	}

