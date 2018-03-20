import 'arrays_complex_memory_index_access.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract arrays_complex_memory_index_access_Test is Soltest { 
    function test_arrays_complex_memory_index_access() { 
        // compileAndRun(sourceCode, 0, "Test");
        //
        // vector<u256> data{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
        // BOOST_REQUIRE(callContractFunction(
        // 		"set(uint24[3][],uint256,uint256)",
        // 		u256(0x60),
        // 		u256(3),
        // 		u256(2),
        // 		u256(data.size() / 3),
        // 		data
        // ) == encodeArgs(u256(data.size() / 3), u256(data[3 * 3 + 2])));
    } 
} 

