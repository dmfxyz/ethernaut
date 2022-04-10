// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Flipper.sol";
import "../CoinFlip.sol";

contract ContractTest is DSTest {
    Flipper f;
    CoinFlip cf;
    function setUp() public {
        cf = new CoinFlip();
        f = new Flipper();
    }

    function testSay42() public {
        uint256 result = f.say42();
        assertEq(result, 42);
    }

    function testFlip() public {
        bool result = f.winFlip(address(cf));
        require(result);
    }

    function testFlipForked() public {
        Flipper flipper = new Flipper();
        require(flipper.winFlip(0xD4FeeDbdBEdAfE77E823339C6346672ea73fe853));
    }
}
