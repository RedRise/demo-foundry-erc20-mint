// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/Script.sol";
// this import allows to use the function `deal` to mint token
import "forge-std/StdUtils.sol";
import {DemoToken} from "src/DemoToken.sol";
import {IERC20} from "openzeppelin/token/ERC20/IERC20.sol";

contract DemoTokenScript is Script {
    DemoToken public token;
    address public alice;
    address public bob;
    uint deployer;

    function setUp() public {
        deployer = vm.envUint("ANVIL_FIRST_PK");

        alice = address(vm.envAddress("ALICE"));
        vm.label(alice, "alice");

        bob = address(vm.envAddress("BOB"));
        vm.label(bob, "bob");
    }

    function run() public {
        //vm.deal(bob, 1e18);
        vm.startBroadcast(deployer);

        token = new DemoToken();

        console2.log("DemoToken address", address(token));
        console2.log("Alice's balance before deal", token.balanceOf(alice));

        token.mint(alice, 1000);
        //deal(address(token), alice, 1000);
        console2.log("Alice's balance before deal", token.balanceOf(alice));

        vm.stopBroadcast();
    }

    function pranking() public {
        vm.startBroadcast(bob);

        token = DemoToken(address(0xE536720791A7DaDBeBdBCD8c8546fb0791a11901));
        console2.log("ici");
        console2.log("Alice's balance before deal", token.balanceOf(alice));
        console2.log("et la");
        token.mint(alice, 1000);

        vm.stopBroadcast();
    }
}
