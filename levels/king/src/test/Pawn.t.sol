// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Pawn.sol";
import "../King.sol";

interface Vm {
    function expectRevert() external;
}

contract ContractTest is DSTest {

    King k;
    Pawn p;
    Vm vm = Vm(HEVM_ADDRESS);
    function setUp() public {
        k = new King{value: 0.05 ether}();
        p = new Pawn();
    }

    function testCanTakeOver() public {
        emit log_address(k._king());
        p.pay{value: 0.06 ether}(payable(k));
        assertEq(address(p), k._king());
        vm.expectRevert();
        address(k).call{value: 0.07 ether}("");
    }

    receive() external payable {}
}
