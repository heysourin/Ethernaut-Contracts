// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}

/*
It is possible to access even private functions:
await web3.eth.getStorageAt(contract.address, 1) ~ Here 0-> locked and 1-> password.

On the above case you will get return in hex, incase you want to see them on Ascii:
web3.utils.hexToAscii('0x0x412076657279207374726f6e67207365637265742070617373776f7264203a29')
*/
