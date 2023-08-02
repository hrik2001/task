// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Transfer} from "../src/Transfer.sol";
import {TestERC20} from "../src/TestERC20.sol";


import {Test, console2} from "forge-std/Test.sol";

contract TransferTests is Test {
    TestERC20 testERC20;
    Transfer transfer;
    function setUp() public {
        testERC20 = new TestERC20(type(uint256).max);
        transfer = new Transfer();
        testERC20.approve(address(transfer), 500);
    }

    /// @dev Basic fuzz test
    function testFirst(uint256 allowance, uint256 amount) public payable {
        vm.assume(allowance != 0 && amount != 0);
        amount = bound(amount, 1, allowance);
        transfer.transferToken(address(testERC20), address(1), 400);
        vm.expectRevert();
        transfer.transferEth{value: 0}(payable(address(1)));
    }


}