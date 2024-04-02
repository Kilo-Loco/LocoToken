// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LocoToken is ERC20 {
    error NotOwnerError();

    address private immutable i_owner;

    constructor(uint initialSupply) ERC20("Loco Token", "LOCO") {
        uint ownersShare = initialSupply / 2;
        uint remainingShare = initialSupply / 2;
        i_owner = msg.sender;
        _mint(i_owner, ownersShare);
        _mint(address(this), remainingShare);
    }

    function transferToFaucet(address faucetAddress, uint amount) external {
        if (msg.sender != i_owner) {
            revert NotOwnerError();
        }
        _approve(address(this), faucetAddress, amount);
        _transfer(address(this), faucetAddress, amount);
    }

    function getOwner() external view returns (address) {
        return i_owner;
    }
}
