// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Owned.sol";
import "./Logger.sol";
import "./IFaucet.sol";

contract Faucet is Owned, Logger, IFaucet {
    uint256 public numOfFunders;
    mapping(address => bool) public funders;
    mapping(uint256 => address) public lutFunders;

    receive() external payable {}

    function emitLog() public pure override returns (bytes32) {
        return "hello";
    }

    modifier limitWithdraw(uint256 amount) {
        require(
            amount <= 1000000000000000000,
            "Cannot withdraw more than 1 eth"
        );
        _;
    }

    function addFunds() external payable override {
        address funder = msg.sender;

        if (!funders[funder]) {
            uint256 index = numOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function withdraw(uint256 amount) external override limitWithdraw(amount) {
        payable(msg.sender).transfer(amount);
    }

    function getAllFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numOfFunders);

        for (uint256 i = 0; i < numOfFunders; i++) {
            _funders[i] = lutFunders[i];
        }
        return _funders;
    }

    function getFunderById(uint8 id) external view returns (address) {
        return lutFunders[id];
    }
}
