import 'calldata_offset.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract calldata_offset_Test is Soltest { 
    function test_calldata_offset() { 
        // compileAndRun(sourceCode, 0, "CB", encodeArgs(u256(0x20)));
        // ABI_CHECK(callContractFunction("last()", encodeArgs()), encodeDyn(string("nd")));
    } 
} 

