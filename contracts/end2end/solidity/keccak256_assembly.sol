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

