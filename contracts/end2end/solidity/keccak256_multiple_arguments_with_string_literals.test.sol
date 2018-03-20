import 'keccak256_multiple_arguments_with_string_literals.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract keccak256_multiple_arguments_with_string_literals_Test is Soltest { 
    function test_keccak256_multiple_arguments_with_string_literals() { 
        // compileAndRun(sourceCode);
        //
        // ABI_CHECK(callContractFunction("foo()"), encodeArgs(dev::keccak256("foo")));
        //
        // ABI_CHECK(callContractFunction("bar(uint256,uint16)", 10, 12), encodeArgs(
        // 	dev::keccak256(
        // 		toBigEndian(u256(10)) +
        // 		bytes{0x0, 0xc} +
        // 		bytes(1, 0x91) +
        // 		bytes{0x66, 0x6f, 0x6f}
        // 	)
        // ));
    } 
} 

