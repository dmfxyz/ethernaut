// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ds-test/test.sol";
import "../Force.sol";
import "../Boom.sol";

contract ContractTest is DSTest {

    Force f;
    Boom b;
    function setUp() public {
        f = new Force();
        b = new Boom();
    }

    function testPwn() public {
        bytes memory arg = abi.encode(address(f));
        emit log_bytes(arg);
        address(b).call{value: 0.5 ether}(abi.encode(address(f)));
        assertEq(address(f).balance, 0.5 ether);
    }
}
