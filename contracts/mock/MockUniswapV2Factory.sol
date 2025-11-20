// SPDX-License-Identifier: MIT
pragma solidity =0.8.4;

import "./MockUniswapV2Pair.sol";

contract MockUniswapV2Factory {
  address public token;

  function createPair() external returns (address) {
    MockUniswapV2Pair pair = new MockUniswapV2Pair(msg.sender);
    token = address(pair);
    return token;
  }

  function getPair(address token0, address token1)
    public
    view
    returns (address)
  {
    return token;
  }
}
