// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

contract PrankDialer {

    constructor(){}

    function ring(address target, address new_owner) public {
        (bool success, ) = target.call(abi.encodeWithSignature("changeOwner(address)", new_owner));
        require(success);
    }
}
