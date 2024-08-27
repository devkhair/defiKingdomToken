// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    mapping(address => uint256) private balances;

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");

        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(_amount <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= _amount;

        payable(msg.sender).transfer(_amount);
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
