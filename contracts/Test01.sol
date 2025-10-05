// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;


contract test01{

    struct User {
        uint256 votes;
        bool exists;
        
    }

    mapping(string => User) public votePoll;
    string[] public candidates;
   

    //给候选人投票
    function vote(string memory name) public {
        

        //如何候选人不存在则创建
        if (!votePoll[name].exists) {
            votePoll[name] = User({
                votes: 0,
                exists: true
            });
        }
        candidates.push(name);
        votePoll[name].votes += 1;
    }

    //获取候选人票数
    function getVotes(string memory name) view public returns(uint256){

        require(votePoll[name].exists,"The candidate does not exist.");

        return votePoll[name].votes;
    }

    //重置所有候选人的得票数
    function resetVotes() public {

        for (uint i = 0; i < candidates.length; i++) {
            votePoll[candidates[i]].votes = 0;
        }
    }



}