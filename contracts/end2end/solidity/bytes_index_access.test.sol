import 'bytes_index_access.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract bytes_index_access_Test is Soltest { 
    function test_bytes_index_access() { 
        // compileAndRun(sourceCode);
        // string array{
        // 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        // 	10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
        // 	20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
        // 	30, 31, 32, 33};
        // ABI_CHECK(callContractFunction("direct(bytes,uint256)", 64, 33, u256(array.length()), array), encodeArgs(33));
        // ABI_CHECK(callContractFunction("storageCopyRead(bytes,uint256)", 64, 33, u256(array.length()), array), encodeArgs(33));
        // ABI_CHECK(callContractFunction("storageWrite()"), encodeArgs(0x193));
    } 
} 

