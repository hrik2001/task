// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface ITransfer {
    
    /// @dev Error when insufficient balance is there
    error InsufficientBalance();

    /// @dev Error when input amount is 0
    error ZeroValueError();
    
    /// @dev Error when transfer of ERC20 tokens fail
    error TokenTransferFailure();

    /// @notice Transfer ERC20 token on your behalf after approving this contract
    /// @dev Transfers ERC20 tokens from the contract deployer (msg.sender) to the recipient.
    /// @param tokenAddress Address of the ERC20 token contract to interact with.
    /// @param recipient Address of the recipient who will receive the tokens.
    /// @param amount The amount of ERC20 tokens to be transferred.
    function transferToken(address tokenAddress, address recipient, uint256 amount) external;

    /// @notice Transfer ethers on your behalf after approving this contract
    /// @dev Transfers ethers tokens from the contract deployer (msg.sender) to the recipient.
    /// @param recipient Address of the recipient who will receive the ether.
    function transferEth(address payable recipient) external payable;
}