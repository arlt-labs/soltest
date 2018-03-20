import 'library_call.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract library_call_Test is Soltest { 
    function test_library_call() { 
        // compileAndRun(sourceCode, 0, "Lib");
        // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
        // ABI_CHECK(callContractFunction("f(uint256)", u256(33)), encodeArgs(u256(33) * 9));
    } 
} 

