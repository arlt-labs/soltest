import 'constant_string_literal.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract constant_string_literal_Test is Soltest { 
    function test_constant_string_literal() { 
        //
        // compileAndRun(sourceCode);
        // string longStr = "abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca";
        // string shortStr = "abcdefghijklmnopq";
        // ABI_CHECK(callContractFunction("b()"), encodeArgs(shortStr));
        // ABI_CHECK(callContractFunction("x()"), encodeDyn(longStr));
        // ABI_CHECK(callContractFunction("getB()"), encodeArgs(shortStr));
        // ABI_CHECK(callContractFunction("getX()"), encodeDyn(longStr));
        // ABI_CHECK(callContractFunction("getX2()"), encodeDyn(longStr));
        // ABI_CHECK(callContractFunction("unused()"), encodeArgs(2));
    } 
} 

