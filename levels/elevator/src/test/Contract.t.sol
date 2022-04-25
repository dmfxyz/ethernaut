// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "ds-test/test.sol";
import "../Elevator.sol";
import "../Contract.sol";

contract ContractTest is DSTest {

    Contract c;
    Elevator e;
    function setUp() public {
        c = new Contract();
        e = new Elevator();
    }

    function testPwn() public {
        c.pwn(address(e));
        assertTrue(e.top());
    }
}
