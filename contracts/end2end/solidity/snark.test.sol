import 'snark.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract snark_Test is Soltest { 
    function test_snark() { 
        // compileAndRun(sourceCode, 0, "Pairing");
        // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Pairing", m_contractAddress}});
        // // Disabled because the point seems to be not well-formed, we need to find another example.
        // //BOOST_CHECK(callContractFunction("testMul()") == encodeArgs(true));
        // BOOST_CHECK(callContractFunction("f()") == encodeArgs(true));
        // BOOST_CHECK(callContractFunction("g()") == encodeArgs(true));
        // BOOST_CHECK(callContractFunction("pair()") == encodeArgs(true));
        // BOOST_CHECK(callContractFunction("verifyTx()") == encodeArgs(true));
    } 
} 

