// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract ERC20Staking {
    using SafeERC20 for IERC20;

    IERC20 public immutable token;
    uint256 public immutable rewardsPerHour = 1000; // 0.01%
    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public lastUpdated;
    uint256 public totalStaked = 0;
    event Deposit(address address_, uint256 amount_);

    constructor(IERC20 token_) {
        token = token_;
    }

    function totalRewards() external view returns (uint256) {
        return _totalRewards();
    }

    function _totalRewards() internal view returns (uint256) {
        return token.balanceOf(address(this)) - totalStaked;
    }

    function deposit(uint256 amount_) external {
        token.safeTransferFrom(msg.sender, address(this), amount_);
        balanceOf[msg.sender] += amount_;
        lastUpdated[msg.sender] = block.timestamp;
        totalStaked += amount_;
        emit Deposit(msg.sender, amount_);
    }

    function rewards(address address_) external view returns (uint256) {
        return _rewards(address_);
    }

    function _rewards(address address_) internal view returns (uint256) {
        return
            ((block.timestamp - lastUpdated[address_]) * balanceOf[address_]) /
            (rewardsPerHour * 1 hours);
    }

    function claim() external {
        uint256 amount = _rewards(msg.sender);
        token.safeTransfer(msg.sender, amount);
    }
}
