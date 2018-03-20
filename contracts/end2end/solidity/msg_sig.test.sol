import 'msg_sig.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract msg_sig_Test is Soltest { 
    function test_msg_sig() { 
        // compileAndRun(sourceCode);
        // ABI_CHECK(callContractFunction("foo(uint256)", 0), encodeArgs(asString(FixedHash<4>(dev::keccak256("foo(uint256)")).asBytes())));
    } 
} 

