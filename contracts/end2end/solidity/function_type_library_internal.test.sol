import 'function_type_library_internal.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract function_type_library_internal_Test is Soltest { 
    function test_function_type_library_internal() { 
        //
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("f(uint256[])", 0x20, 3, u256(1), u256(7), u256(3)), encodeArgs(u256(11)));
    } 
} 

