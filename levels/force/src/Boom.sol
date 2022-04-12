// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

contract Boom {

    constructor(){}

    fallback() external payable {
        assembly {
            selfdestruct(calldataload(0x0))
        }
    }
}
