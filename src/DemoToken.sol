// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20PresetMinterPauser} from "openzeppelin/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract DemoToken is ERC20PresetMinterPauser {
    constructor() ERC20PresetMinterPauser("Demo Token", "DEMO") {}
}
