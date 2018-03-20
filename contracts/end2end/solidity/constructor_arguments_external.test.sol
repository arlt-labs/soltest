import 'constructor_arguments_external.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract constructor_arguments_external_Test is Soltest { 
    function test_constructor_arguments_external() { 
        // compileAndRun(sourceCode, 0, "Main", encodeArgs("abc", true));
        // ABI_CHECK(callContractFunction("getFlag()"), encodeArgs(true));
        // ABI_CHECK(callContractFunction("getName()"), encodeArgs("abc"));
    } 
} 

