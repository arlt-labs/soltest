import 'mutex.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract mutex_Test is Soltest { 
    function test_mutex() { 
        // compileAndRun(sourceCode, 500, "Fund");
        // auto fund = m_contractAddress;
        // BOOST_CHECK_EQUAL(balanceAt(fund), 500);
        // compileAndRun(sourceCode, 0, "Attacker", encodeArgs(u160(fund)));
        // ABI_CHECK(callContractFunction("setProtected(bool)", true), encodeArgs());
        // ABI_CHECK(callContractFunction("attack()"), encodeArgs());
        // BOOST_CHECK_EQUAL(balanceAt(fund), 500);
        // ABI_CHECK(callContractFunction("setProtected(bool)", false), encodeArgs());
        // ABI_CHECK(callContractFunction("attack()"), encodeArgs(u256(460)));
        // BOOST_CHECK_EQUAL(balanceAt(fund), 460);
    } 
} 

