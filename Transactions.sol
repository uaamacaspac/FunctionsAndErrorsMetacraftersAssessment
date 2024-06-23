// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Transactions {
    mapping(address => uint256) private balances;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "The caller should be the owner.");
        _;
    }

    function addition(uint256 _amount) public payable {
        require(_amount > 0, "Amount to be added must be greater than zero");
        balances[msg.sender] += _amount;
    }

    function subtraction(uint256 _amount) public {
        assert(balances[msg.sender] >= _amount);
        
        balances[msg.sender] -= _amount;
        
        (bool success, ) = msg.sender.call{value: _amount}("");
        if (!success) {
            revert("Subtraction failed.");
        }
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
