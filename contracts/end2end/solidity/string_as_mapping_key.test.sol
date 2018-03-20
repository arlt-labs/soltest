import 'string_as_mapping_key.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract string_as_mapping_key_Test is Soltest { 
    function test_string_as_mapping_key() { 
        // compileAndRun(sourceCode, 0, "Test");
        // vector<string> strings{
        // 	"Hello, World!",
        // 	"Hello,                            World!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1111",
        // 	"",
        // 	"1"
        // };
        // for (unsigned i = 0; i < strings.size(); i++)
        // 	ABI_CHECK(callContractFunction(
        // 		"set(string,uint256)",
        // 		u256(0x40),
        // 		u256(7 + i),
        // 		u256(strings[i].size()),
        // 		strings[i]
        // 	), encodeArgs());
        // for (unsigned i = 0; i < strings.size(); i++)
        // 	ABI_CHECK(callContractFunction(
        // 		"get(string)",
        // 		u256(0x20),
        // 		u256(strings[i].size()),
        // 		strings[i]
        // 	), encodeArgs(u256(7 + i)));
    } 
} 

