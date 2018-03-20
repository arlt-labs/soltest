import 'internal_constructor.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract internal_constructor_Test is Soltest { 
    function test_internal_constructor() { 
        // BOOST_CHECK(compileAndRunWithoutCheck(sourceCode, 0, "C").empty());
    } 
} 

