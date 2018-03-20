import 'events_with_same_name.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract events_with_same_name_Test is Soltest { 
    function test_events_with_same_name() { 
        // u160 const c_loggedAddress = m_contractAddress;
        //
        // compileAndRun(sourceCode);
        // ABI_CHECK(callContractFunction("deposit()"), encodeArgs(u256(1)));
        // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
        // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
        // BOOST_CHECK(m_logs[0].data.empty());
        // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
        // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit()")));
        //
        // ABI_CHECK(callContractFunction("deposit(address)", c_loggedAddress), encodeArgs(u256(1)));
        // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
        // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
        // BOOST_CHECK(m_logs[0].data == encodeArgs(c_loggedAddress));
        // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
        // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(address)")));
        //
        // ABI_CHECK(callContractFunction("deposit(address,uint256)", c_loggedAddress, u256(100)), encodeArgs(u256(1)));
        // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
        // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
        // BOOST_CHECK(m_logs[0].data == encodeArgs(c_loggedAddress, 100));
        // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
        // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(address,uint256)")));
    } 
} 

