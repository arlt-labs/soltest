import 'same_function_in_construction_and_runtime.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract same_function_in_construction_and_runtime_Test is Soltest { 
    function test_same_function_in_construction_and_runtime() { 
        //
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("runtime(uint256)", encodeArgs(u256(3))), encodeArgs(u256(6)));
        // ABI_CHECK(callContractFunction("initial()"), encodeArgs(u256(4)));
    } 
} 

