import 'library_function_external.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract library_function_external_Test is Soltest { 
    function test_library_function_external() { 
        // compileAndRun(sourceCode, 0, "Lib");
        // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
        // ABI_CHECK(callContractFunction("f(bytes)", u256(0x20), u256(5), "abcde"), encodeArgs("c"));
    } 
} 

