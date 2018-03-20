import 'sign_extension.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract sign_extension_Test is Soltest { 
    function test_sign_extension() { 
        // compileAndRun(sourceCode);
        // auto sign_extension_cpp = []() -> u256
        // {
        // 	int64_t x = -int32_t(0xff);
        // 	if (x >= 0xff)
        // 		return 0;
        // 	return u256(x) * -1;
        // };
        // testContractAgainstCpp("run()", sign_extension_cpp);
    } 
} 

