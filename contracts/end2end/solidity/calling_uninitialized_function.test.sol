import 'calling_uninitialized_function.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract calling_uninitialized_function_Test is Soltest { 
    function test_calling_uninitialized_function() { 
        //
        // compileAndRun(sourceCode, 0, "C");
        // // This should throw exceptions
        // ABI_CHECK(callContractFunction("intern()"), encodeArgs());
        // ABI_CHECK(callContractFunction("extern()"), encodeArgs());
    } 
} 

