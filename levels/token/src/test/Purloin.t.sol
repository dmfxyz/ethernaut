// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.0;

import "ds-test/test.sol";
import "../Purloin.sol";
import "../Token.sol";

contract ContractTest is DSTest {

    Token t;
    Purloin c;
    function setUp() public {
        t = new Token(20);
        c = new Purloin();
    }

    function testPwn() public {
        emit log_uint(t.balanceOf(address(this)));
        t.transfer(address(c), 0x14);
        emit log_uint(t.balanceOf(address(c)));
        c.purloin(address(t), address(this));
        emit log_uint(t.balanceOf(address(this)));
        assertGt(t.balanceOf(address(this)), 20);
    }
}
