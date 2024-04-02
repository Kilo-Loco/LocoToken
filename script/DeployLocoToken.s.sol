// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {LocoToken} from "../src/LocoToken.sol";

contract DeployLocoToken is Script {
    function run() external returns (LocoToken) {
        vm.startBroadcast();
        uint initialSupply = 1000 * (10 ** 18);
        LocoToken token = new LocoToken(initialSupply);
        vm.stopBroadcast();
        return token;
    }
}
