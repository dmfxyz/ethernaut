// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

contract Pawn {

    constructor(){}

    function pay(address payable target) public payable {
        (bool success, ) = target.call{value: msg.value}("");
        require(success);
    }

    receive() external payable {
        revert();
    } 
}
