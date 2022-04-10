// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Contract.sol";
import "../Telephone.sol";

interface Vm {
    function startPrank(address) external;
    function prank(address) external;
    function stopPrank() external;
}

contract ContractTest is DSTest {
    Vm vm = Vm(HEVM_ADDRESS);
    Contract c;
    Telephone t;
    function setUp() public {
        c = new Contract();
        t = new Telephone();
    }

    function testPwn() public {
        emit log_address(t.owner());
        vm.startPrank(address(0xdead));
        c.pwn(address(t), address(0xdead));
        vm.stopPrank();
        emit log_address(t.owner());
        assertEq(t.owner(), address(0xdead));
    }
}
