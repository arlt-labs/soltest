import 'pass_function_types_externally.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract pass_function_types_externally_Test is Soltest { 
    function test_pass_function_types_externally() { 
        //
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("f(uint256)", 7), encodeArgs(u256(8)));
        // ABI_CHECK(callContractFunction("f2(uint256)", 7), encodeArgs(u256(8)));
    } 
} 

