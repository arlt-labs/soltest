import 'event.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract event_Test is Soltest { 
    function test_event() { 
        // compileAndRun(sourceCode);
        // u256 value(18);
        // u256 id(0x1234);
        // for (bool manually: {true, false})
        // {
        // 	callContractFunctionWithValue("deposit(bytes32,bool)", value, id, manually);
        // 	BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
        // 	BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
        // 	BOOST_CHECK_EQUAL(h256(m_logs[0].data), h256(u256(value)));
        // 	BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 3);
        // 	BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(address,bytes32,uint256)")));
        // 	BOOST_CHECK_EQUAL(m_logs[0].topics[1], h256(m_sender, h256::AlignRight));
        // 	BOOST_CHECK_EQUAL(m_logs[0].topics[2], h256(id));
        // }
    } 
} 

