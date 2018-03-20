import 'library_call_in_homestead.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract library_call_in_homestead_Test is Soltest { 
    function test_library_call_in_homestead() { 
        // compileAndRun(sourceCode, 0, "Lib");
        // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
        // ABI_CHECK(callContractFunction("f()"), encodeArgs());
        // ABI_CHECK(callContractFunction("sender()"), encodeArgs(u160(m_sender)));
    } 
} 

