/// @ext:soltest
/// {accessor_for_const_state_variable}
///     //
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("ticketPrice()"), encodeArgs(u256(555)));
contract Lotto{
	uint constant public ticketPrice = 555;
}

