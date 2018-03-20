import 'inter_contract_calls.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract inter_contract_calls_Test is Soltest { 
    function test_inter_contract_calls() { 
        // compileAndRun(sourceCode, 0, "Helper");
        // u160 const c_helperAddress = m_contractAddress;
        // compileAndRun(sourceCode, 0, "Main");
        // BOOST_REQUIRE(callContractFunction("setHelper(address)", c_helperAddress) == bytes());
        // BOOST_REQUIRE(callContractFunction("getHelper()", c_helperAddress) == encodeArgs(c_helperAddress));
        // u256 a(3456789);
        // u256 b("0x282837623374623234aa74");
        // BOOST_REQUIRE(callContractFunction("callHelper(uint256,uint256)", a, b) == encodeArgs(a * b));
    } 
} 

