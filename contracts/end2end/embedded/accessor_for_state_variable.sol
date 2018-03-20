/// @ext:soltest
/// {accessor_for_state_variable}
///     //
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("ticketPrice()"), encodeArgs(u256(500)));
contract Lotto {
	uint public ticketPrice = 500;
}

