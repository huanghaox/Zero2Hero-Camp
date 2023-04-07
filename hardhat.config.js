
require('@nomicfoundation/hardhat-toolbox');
require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require('dotenv').config();


module.exports = {
  solidity: "0.8.17",
  networks: {
    BNB_testnet: {
      url:process.env.BNB_TEST_URL ,
      accounts:process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
  }
};
 