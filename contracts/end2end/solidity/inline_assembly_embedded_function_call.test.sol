import 'inline_assembly_embedded_function_call.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract inline_assembly_embedded_function_call_Test is Soltest { 
    function test_inline_assembly_embedded_function_call() { 
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(1), u256(4), u256(7), u256(0x10)));
    } 
} 

