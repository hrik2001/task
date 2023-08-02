// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Transfer} from "../src/Transfer.sol";
import {TestERC20} from "../src/TestERC20.sol";

contract TransferScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        TestERC20 testERC20 = new TestERC20(type(uint256).max);
        Transfer transfer = new Transfer();
        testERC20.approve(address(transfer), 500);
        transfer.transferToken(address(testERC20), address(1), 400);

        vm.stopBroadcast();
    }
}
