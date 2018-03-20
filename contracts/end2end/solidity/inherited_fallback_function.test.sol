import 'inherited_fallback_function.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract inherited_fallback_function_Test is Soltest { 
    function test_inherited_fallback_function() { 
        // compileAndRun(sourceCode, 0, "B");
        // ABI_CHECK(callContractFunction("getData()"), encodeArgs(0));
        // ABI_CHECK(callContractFunction(""), encodeArgs());
        // ABI_CHECK(callContractFunction("getData()"), encodeArgs(1));
    } 
} 

