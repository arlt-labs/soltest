import 'transfer_ether.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract transfer_ether_Test is Soltest { 
    function test_transfer_ether() { 
        // compileAndRun(sourceCode, 0, "B");
        // u160 const nonPayableRecipient = m_contractAddress;
        // compileAndRun(sourceCode, 0, "C");
        // u160 const oogRecipient = m_contractAddress;
        // compileAndRun(sourceCode, 20, "A");
        // u160 payableRecipient(23);
        // ABI_CHECK(callContractFunction("a(address,uint256)", payableRecipient, 10), encodeArgs(10));
        // BOOST_CHECK_EQUAL(balanceAt(payableRecipient), 10);
        // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 10);
        // ABI_CHECK(callContractFunction("b(address,uint256)", nonPayableRecipient, 10), encodeArgs());
        // ABI_CHECK(callContractFunction("b(address,uint256)", oogRecipient, 10), encodeArgs());
    } 
} 

