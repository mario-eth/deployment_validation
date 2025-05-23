// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Hardhat is Ownable { // test storageLayout of hardhat imports

    struct Struct1 {
        uint256 a;
        uint192 b;
    }

    uint256 c;

    constructor() Ownable(address(19)) {
        Struct1 storage $1 = _getStorage1();
        $1.a = 20;
        $1.b = 21;

        c = 22;
    }

    bytes32 private constant StorageLocation1 = 0x41ef84cfd2398a02556624f13effd41aa790a48ce39e70d3a0dc298f7a4dec8a;

    function _getStorage1() internal pure returns (Struct1 storage $) {
        assembly {
            $.slot := StorageLocation1
        }
    }

    function dummy() external {}

}