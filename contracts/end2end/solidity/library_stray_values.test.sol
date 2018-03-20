import 'library_stray_values.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract library_stray_values_Test is Soltest { 
    function test_library_stray_values() { 
        // compileAndRun(sourceCode, 0, "Lib");
        // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
        // ABI_CHECK(callContractFunction("f(uint256)", u256(33)), encodeArgs(u256(42)));
    } 
} 

