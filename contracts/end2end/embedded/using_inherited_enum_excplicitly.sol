	/// @ext:soltest
/// {using_inherited_enum_excplicitly}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("answer()"), encodeArgs(1));
contract base {
		enum Choice { A, B, C }
	}

	contract test is base {
		function answer () returns (base.Choice _ret)
		{
			_ret = base.Choice.B;
		}
	}

