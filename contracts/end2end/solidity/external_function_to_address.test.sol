import 'external_function_to_address.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract external_function_to_address_Test is Soltest { 
    function test_external_function_to_address() { 
        //
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("f()"), encodeArgs(true));
        // ABI_CHECK(callContractFunction("g(function)", fromHex("00000000000000000000000000000000000004226121ff00000000000000000")), encodeArgs(u160(0x42)));
    } 
} 

