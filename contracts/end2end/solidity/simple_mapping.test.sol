import 'simple_mapping.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract simple_mapping_Test is Soltest { 
    function test_simple_mapping() { 
        // compileAndRun(sourceCode);
        //
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0)), encodeArgs(byte(0x00)));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(byte(0x00)));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0xa7)), encodeArgs(byte(0x00)));
        // callContractFunction("set(uint8,uint8)", byte(0x01), byte(0xa1));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0x00)), encodeArgs(byte(0x00)));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(byte(0xa1)));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0xa7)), encodeArgs(byte(0x00)));
        // callContractFunction("set(uint8,uint8)", byte(0x00), byte(0xef));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0x00)), encodeArgs(byte(0xef)));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(byte(0xa1)));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0xa7)), encodeArgs(byte(0x00)));
        // callContractFunction("set(uint8,uint8)", byte(0x01), byte(0x05));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0x00)), encodeArgs(byte(0xef)));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(byte(0x05)));
        // ABI_CHECK(callContractFunction("get(uint8)", byte(0xa7)), encodeArgs(byte(0x00)));
    } 
} 

