	/// @ext:soltest
/// {using_contract_enums_with_explicit_contract_name}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("answer()"), encodeArgs(1));
contract test {
		enum Choice { A, B, C }
		function answer () returns (test.Choice _ret)
		{
			_ret = test.Choice.B;
		}
	}

