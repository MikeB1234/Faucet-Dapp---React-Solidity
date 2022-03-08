// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//interface contracts can only inherit from other interfaces
//they cannot declare constructor or state variable
//all declared functions must be external

interface IFaucet {
    function addFunds() external payable;

    function withdraw(uint256 amount) external;
}
