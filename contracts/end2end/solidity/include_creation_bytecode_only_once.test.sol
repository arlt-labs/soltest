import 'include_creation_bytecode_only_once.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract include_creation_bytecode_only_once_Test is Soltest { 
    function test_include_creation_bytecode_only_once() { 
        // compileAndRun(sourceCode);
        // BOOST_CHECK_LE(
        // 	double(m_compiler.object("Double").bytecode.size()),
        // 	1.1 * double(m_compiler.object("Single").bytecode.size())
        // );
    } 
} 

