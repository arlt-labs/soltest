import 'packed_sha256.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract packed_sha256_Test is Soltest { 
    function test_packed_sha256() { 
        // compileAndRun(sourceCode);
        // auto f = [&](u256 const& _x) -> bytes
        // {
        // 	if (_x == u256(4))
        // 		return fromHex("804e0d7003cfd70fc925dc103174d9f898ebb142ecc2a286da1abd22ac2ce3ac");
        // 	if (_x == u256(5))
        // 		return fromHex("e94921945f9068726c529a290a954f412bcac53184bb41224208a31edbf63cf0");
        // 	if (_x == u256(-1))
        // 		return fromHex("f14def4d07cd185ddd8b10a81b2238326196a38867e6e6adbcc956dc913488c7");
        // 	return fromHex("");
        // };
        // testContractAgainstCpp("a(bytes32)", f, u256(4));
        // testContractAgainstCpp("a(bytes32)", f, u256(5));
        // testContractAgainstCpp("a(bytes32)", f, u256(-1));
    } 
} 

