// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CoachingCenter{
    struct student {
        string name;
        bool paid;
        address studentAddress;
        uint payingTime;
    }

    mapping(address => student) feePaidStidents;

    function payFee(string memory name) public payable returns(string memory){
        require(msg.value >= 1 ether, "Fee is 1 ether");
        feePaidStidents[msg.sender] = student(name, true, msg.sender, block.timestamp);
        return "Fees Paid Successfully";
    }

    function allowToTakeClass() public view returns(string memory){
        if(feePaidStidents[msg.sender].paid){
            return "Fee is paid, allowed to take class";
        }
        else{
            return "Fee is unpaid, not allowed to take class";
        }
    }
}