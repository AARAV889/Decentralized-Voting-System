// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Project {
    address public admin;
    mapping(address => bool) public hasVoted;
    mapping(string => uint) public votes;
    string[] public candidates;

    constructor(string[] memory _candidates) {
        admin = msg.sender;
        candidates = _candidates;
    }

    function vote(string memory _candidate) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        bool valid = false;
        for (uint i = 0; i < candidates.length; i++) {
            if (keccak256(bytes(candidates[i])) == keccak256(bytes(_candidate))) {
                valid = true;
                break;
            }
        }
        require(valid, "Invalid candidate.");
        votes[_candidate]++;
        hasVoted[msg.sender] = true;
    }

    function getVotes(string memory _candidate) public view returns (uint) {
        return votes[_candidate];
    }

    function getCandidates() public view returns (string[] memory) {
        return candidates;
    }
}

