pragma solidity ^0.8.0;

interface ICoinFlip {
    function  flip(bool _guess) external returns (bool);
}