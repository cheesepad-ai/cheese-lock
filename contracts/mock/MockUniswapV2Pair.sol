// SPDX-License-Identifier: MIT
pragma solidity =0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockUniswapV2Pair is ERC20 {
  address public token0;
  address public token1;
  address public factory;

  constructor(address owner) ERC20("Pair", "Pair") {
    factory = msg.sender;
    _mint(owner, 1_000_000 * 10**18);
  }
}
