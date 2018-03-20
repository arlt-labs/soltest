import 'failing_send.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract failing_send_Test is Soltest { 
    function test_failing_send() { 
        // compileAndRun(sourceCode, 0, "Helper");
        // u160 const c_helperAddress = m_contractAddress;
        // compileAndRun(sourceCode, 20, "Main");
        // BOOST_REQUIRE(callContractFunction("callHelper(address)", c_helperAddress) == encodeArgs(true, 20));
    } 
} 

