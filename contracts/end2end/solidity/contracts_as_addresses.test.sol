import 'contracts_as_addresses.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract contracts_as_addresses_Test is Soltest { 
    function test_contracts_as_addresses() { 
        // compileAndRun(sourceCode, 20);
        // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 20 - 5);
        // BOOST_REQUIRE(callContractFunction("getBalance()") == encodeArgs(u256(20 - 5), u256(5)));
    } 
} 

