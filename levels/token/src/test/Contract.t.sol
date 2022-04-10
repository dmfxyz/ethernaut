// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.0;

import "ds-test/test.sol";
import "../Contract.sol";
import "../Token.sol";

contract ContractTest is DSTest {

    Token t;
    Contract c;
    function setUp() public {
        t = new Token(20);
        c = new Contract();
    }

    function testPwn() public {
        emit log_uint(t.balanceOf(address(this)));
        t.transfer(address(c), 0x14);
        emit log_uint(t.balanceOf(address(c)));
        c.pwn(address(t), address(this));
        emit log_uint(t.balanceOf(address(this)));
    }
}
