// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BPay {
    address public owner;

    event PaymentSent(address indexed from, address indexed to, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function sendPayment(address payable _to) public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        _to.transfer(msg.value);
        emit PaymentSent(msg.sender, _to, msg.value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}
}
