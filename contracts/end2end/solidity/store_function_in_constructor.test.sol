import 'store_function_in_constructor.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract store_function_in_constructor_Test is Soltest { 
    function test_store_function_in_constructor() { 
        //
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("use(uint256)", encodeArgs(u256(3))), encodeArgs(u256(6)));
        // ABI_CHECK(callContractFunction("result_in_constructor()"), encodeArgs(u256(4)));
    } 
} 

