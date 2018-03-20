/// @ext:soltest
/// {transfer_ether}
///     // compileAndRun(sourceCode, 0, "B");
///     // u160 const nonPayableRecipient = m_contractAddress;
///     // compileAndRun(sourceCode, 0, "C");
///     // u160 const oogRecipient = m_contractAddress;
///     // compileAndRun(sourceCode, 20, "A");
///     // u160 payableRecipient(23);
///     // ABI_CHECK(callContractFunction("a(address,uint256)", payableRecipient, 10), encodeArgs(10));
///     // BOOST_CHECK_EQUAL(balanceAt(payableRecipient), 10);
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 10);
///     // ABI_CHECK(callContractFunction("b(address,uint256)", nonPayableRecipient, 10), encodeArgs());
///     // ABI_CHECK(callContractFunction("b(address,uint256)", oogRecipient, 10), encodeArgs());
contract A {
	function A() payable {}
	function a(address addr, uint amount) returns (uint) {
		addr.transfer(amount);
		return this.balance;
	}
	function b(address addr, uint amount) {
		addr.transfer(amount);
	}
}

contract B {
}

contract C {
	function () payable {
		throw;
	}
}

