contract Ballot {
	mapping(address => bool) canVote;
	mapping(address => uint) voteCount;
	mapping(address => bool) voted;
	function getVoteCount(address addr) returns (uint retVoteCount) {
		return voteCount[addr];
	}
	function grantVoteRight(address addr) {
		canVote[addr] = true;
	}
	function vote(address voter, address vote) returns (bool success) {
		if (!canVote[voter] || voted[voter]) return false;
		voted[voter] = true;
		voteCount[vote] = voteCount[vote] + 1;
		return true;
	}
}

