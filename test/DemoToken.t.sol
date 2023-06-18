// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {IERC20} from "openzeppelin/token/ERC20/IERC20.sol";
import {DemoToken} from "src/DemoToken.sol";

contract DemoTokenTest is Test {
    IERC20 public token;

    address public alice;

    function setUp() public {
        address tokenDeployedAddress = 0x5FbDB2315678afecb367f032d93F642f64180aa3;

        assertTrue(
            tokenDeployedAddress != address(0x0),
            "Please insert the address of the token contract, freshly deployed with anvil."
        );

        token = IERC20(tokenDeployedAddress);
        vm.label(tokenDeployedAddress, "DemoToken");

        alice = address(0x1);
        vm.label(alice, "alice");
    }

    function testDemoTokenMintedForAlice() public {
        assertGt(token.balanceOf(alice), 0);
    }
}
