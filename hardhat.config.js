
require('@nomicfoundation/hardhat-toolbox');
require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require('dotenv').config();


module.exports = {
  solidity: "0.8.17",
  networks: {
    hardhat: {
    },
    BNBtestnet: {
      url:process.env.BNB_TEST_URL,
      accounts:process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
  },
  etherscan: {
    apiKey: {
      bscTestnet: process.env.BNB_TEST_API,
    }
  }
};
 