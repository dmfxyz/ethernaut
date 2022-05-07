// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Forwarder {
    constructor(){}

    function forward(address token, address from, address receiver, uint256 amount) external {
        (bool ok, ) = token.call(abi.encodeWithSignature("transferFrom(address,address,uint256)", from, receiver, amount));
        require(ok);
    }
}
