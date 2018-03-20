import 'inherited_function.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract inherited_function_Test is Soltest { 
    function test_inherited_function() { 
        //
        // compileAndRun(sourceCode, 0, "B");
        // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(1)));
    } 
} 

