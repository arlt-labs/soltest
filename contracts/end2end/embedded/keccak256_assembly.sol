/// @ext:soltest
/// {keccak256_assembly}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), fromHex("0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470"));
///     // ABI_CHECK(callContractFunction("g()"), fromHex("0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470"));
///     // ABI_CHECK(callContractFunction("h()"), fromHex("0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470"));
///     // ABI_CHECK(callContractFunction("i()"), fromHex("0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470"));
contract C {
	function f() pure returns (bytes32 ret) {
		assembly {
			ret := keccak256(0, 0)
		}
	}
	function g() pure returns (bytes32 ret) {
		assembly {
			0
			0
			keccak256
			=: ret
		}
	}
	function h() pure returns (bytes32 ret) {
		assembly {
			ret := sha3(0, 0)
		}
	}
	function i() pure returns (bytes32 ret) {
		assembly {
			0
			0
			sha3
			=: ret
		}
	}
}

