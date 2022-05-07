// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/NaughtCoin.sol";
import "src/Forwarder.sol";

contract ContractTest is Test {

    NaughtCoin n;
    Forwarder f;
    function setUp() public {
        n = new NaughtCoin(address(this));
        f = new Forwarder();
        
    }

    function testExample() public {
        address receiver = address(0x1337);
        (bool supply_ok, bytes memory supply) = address(n).call(abi.encodeWithSignature("totalSupply()"));
        uint256 totalsupply = abi.decode(supply, (uint256));
        //emit log_uint(totalsupply);
        (bool approve_ok, ) = address(n).call(abi.encodeWithSignature("approve(address,uint256)", address(f), totalsupply));
        (bool allowance_ok, bytes memory allowance) = address(n).call(abi.encodeWithSignature("allowance(address,address)", address(this), address(f)));
        uint256 forward_allowance = abi.decode(allowance, (uint256));
        //emit log_uint(forward_allowance);
        f.forward(address(n), address(this), receiver, forward_allowance);
        (bool balance_ok, bytes memory bal) = address(n).call(abi.encodeWithSignature("balanceOf(address)", receiver));
        uint256 forwarded_balance = abi.decode(bal, (uint256));
        assertEq(forwarded_balance, totalsupply);        
    }
}
