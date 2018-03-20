import 'internal_types_in_library.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract internal_types_in_library_Test is Soltest { 
    function test_internal_types_in_library() { 
        // compileAndRun(sourceCode, 0, "Lib");
        // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
        // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(4), u256(17)));
    } 
} 

