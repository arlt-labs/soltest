/// @ext:soltest
/// {blockchain}
///     // BOOST_CHECK(m_rpc.rpcCall("miner_setEtherbase", {"\"0x1212121212121212121212121212121212121212\""}).asBool() == true);
///     // m_rpc.test_mineBlocks(5);
///     // compileAndRun(sourceCode, 27);
///     // ABI_CHECK(callContractFunctionWithValue("someInfo()", 28), encodeArgs(28, u256("0x1212121212121212121212121212121212121212"), 7));
contract test {
	function test() payable {}
	function someInfo() payable returns (uint256 value, address coinbase, uint256 blockNumber) {
		value = msg.value;
		coinbase = block.coinbase;
		blockNumber = block.number;
	}
}

