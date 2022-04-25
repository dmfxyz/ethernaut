// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ds-test/test.sol";
import "../Reentrance.sol";
import "../Contract.sol";

contract ContractTest is DSTest {

    Reentrance r;
    Contract c;
    function setUp() public {
        r = new Reentrance{value: 0.004 ether}();
        c = new Contract{value: 0.001 ether}();
    }

    function testPwn() public {
        c.pwn(address(r));
        emit log_uint(address(r).balance);
        emit log_uint(address(c).balance);
    }
}
