import 'inherited_function_from_a_library.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract inherited_function_from_a_library_Test is Soltest { 
    function test_inherited_function_from_a_library() { 
        //
        // compileAndRun(sourceCode, 0, "B");
        // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(1)));
    } 
} 

