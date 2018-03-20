import 'array_copy_storage_abi.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract array_copy_storage_abi_Test is Soltest { 
    function test_array_copy_storage_abi() { 
        // compileAndRun(sourceCode);
        // bytes valueSequence;
        // for (size_t i = 0; i < 101; ++i)
        // 	valueSequence += toBigEndian(u256(i));
        // ABI_CHECK(callContractFunction("test1()"), encodeArgs(0x20, 101) + valueSequence);
        // ABI_CHECK(callContractFunction("test2()"), encodeArgs(0x20, 101) + valueSequence);
        // ABI_CHECK(callContractFunction("test3()"), encodeArgs(0x20, 101) + valueSequence);
        // ABI_CHECK(callContractFunction("test4()"),
        // 	encodeArgs(0x20, 5, 0xa0, 0xa0 + 102 * 32 * 1, 0xa0 + 102 * 32 * 2, 0xa0 + 102 * 32 * 3, 0xa0 + 102 * 32 * 4) +
        // 	encodeArgs(101) + valueSequence +
        // 	encodeArgs(101) + valueSequence +
        // 	encodeArgs(101) + valueSequence +
        // 	encodeArgs(101) + valueSequence +
        // 	encodeArgs(101) + valueSequence
        // );
    } 
} 

