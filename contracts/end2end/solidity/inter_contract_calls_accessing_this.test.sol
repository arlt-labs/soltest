import 'inter_contract_calls_accessing_this.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract inter_contract_calls_accessing_this_Test is Soltest { 
    function test_inter_contract_calls_accessing_this() { 
        // compileAndRun(sourceCode, 0, "Helper");
        // u160 const c_helperAddress = m_contractAddress;
        // compileAndRun(sourceCode, 0, "Main");
        // BOOST_REQUIRE(callContractFunction("setHelper(address)", c_helperAddress) == bytes());
        // BOOST_REQUIRE(callContractFunction("getHelper()", c_helperAddress) == encodeArgs(c_helperAddress));
        // BOOST_REQUIRE(callContractFunction("callHelper()") == encodeArgs(c_helperAddress));
    } 
} 

