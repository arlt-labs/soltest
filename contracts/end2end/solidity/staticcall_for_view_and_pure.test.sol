import 'staticcall_for_view_and_pure.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract staticcall_for_view_and_pure_Test is Soltest { 
    function test_staticcall_for_view_and_pure() { 
        // compileAndRun(sourceCode, 0, "D");
        // // This should work (called via CALL)
        // ABI_CHECK(callContractFunction("f()"), encodeArgs(1));
        // if (dev::test::Options::get().evmVersion().hasStaticCall())
        // {
        // 	// These should throw (called via STATICCALL)
        // 	ABI_CHECK(callContractFunction("fview()"), encodeArgs());
        // 	ABI_CHECK(callContractFunction("fpure()"), encodeArgs());
        // }
        // else
        // {
        // 	ABI_CHECK(callContractFunction("fview()"), encodeArgs(1));
        // 	ABI_CHECK(callContractFunction("fpure()"), encodeArgs(1));
        // }
    } 
} 

