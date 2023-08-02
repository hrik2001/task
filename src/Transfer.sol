// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "./interfaces/ITransfer.sol";

contract Transfer is ITransfer {
     /// @inheritdoc ITransfer
    function transferToken(address tokenAddress, address recipient, uint256 amount) external {
        if (amount == 0) revert ZeroValueError();
        IERC20 token = IERC20(tokenAddress);
        if (token.balanceOf(msg.sender) < amount) revert InsufficientBalance();
        if (!token.transferFrom(msg.sender, recipient, amount)) revert TokenTransferFailure();
    }

     /// @inheritdoc ITransfer
    function transferEth(address payable recipient) external payable {
        if (msg.value == 0) revert ZeroValueError();
        recipient.transfer(msg.value);
    }

}
