import 'library_call_protection.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract library_call_protection_Test is Soltest { 
    function test_library_call_protection() { 
        // compileAndRun(sourceCode, 0, "Lib");
        // ABI_CHECK(callContractFunction("np(Lib.S storage)", 0), encodeArgs());
        // ABI_CHECK(callContractFunction("v(Lib.S storage)", 0), encodeArgs(u160(m_sender)));
        // ABI_CHECK(callContractFunction("pu()"), encodeArgs(2));
        // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
        // ABI_CHECK(callContractFunction("s()"), encodeArgs(0));
        // ABI_CHECK(callContractFunction("np()"), encodeArgs(u160(m_sender)));
        // ABI_CHECK(callContractFunction("s()"), encodeArgs(3));
        // ABI_CHECK(callContractFunction("v()"), encodeArgs(u160(m_sender)));
        // ABI_CHECK(callContractFunction("pu()"), encodeArgs(2));
    } 
} 

