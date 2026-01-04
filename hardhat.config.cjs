require("dotenv").config();
require("@nomicfoundation/hardhat-toolbox");

/**
 * Hardhat CommonJS config with Sepolia network (uses .env)
 */
module.exports = {
  solidity: "0.8.19",
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC_URL || "",
      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
    },
  },
};
