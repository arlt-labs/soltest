import 'external_function.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract external_function_Test is Soltest { 
    function test_external_function() { 
        // compileAndRun(sourceCode);
        // ABI_CHECK(callContractFunction("test(uint256,uint256)", 2, 3), encodeArgs(2+7, 3));
    } 
} 

