import 'bytes_in_arguments.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract bytes_in_arguments_Test is Soltest { 
    function test_bytes_in_arguments() { 
        // compileAndRun(sourceCode);
        //
        // string innercalldata1 = asString(FixedHash<4>(dev::keccak256("f(uint256,uint256)")).asBytes() + encodeArgs(8, 9));
        // string innercalldata2 = asString(FixedHash<4>(dev::keccak256("g(uint256)")).asBytes() + encodeArgs(3));
        // bytes calldata = encodeArgs(
        // 	12, 32 * 4, u256(32 * 4 + 32 + (innercalldata1.length() + 31) / 32 * 32), 13,
        // 	u256(innercalldata1.length()), innercalldata1,
        // 	u256(innercalldata2.length()), innercalldata2);
        // ABI_CHECK(
        // 	callContractFunction("test(uint256,bytes,bytes,uint256)", calldata),
        // 	encodeArgs(12, (8 + 9) * 3, 13, u256(innercalldata1.length()))
        // );
    } 
} 

