import 'invalid_enum_as_external_arg.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract invalid_enum_as_external_arg_Test is Soltest { 
    function test_invalid_enum_as_external_arg() { 
        // compileAndRun(sourceCode, 0, "C");
        // // should throw
        // ABI_CHECK(callContractFunction("test()"), encodeArgs());
    } 
} 

