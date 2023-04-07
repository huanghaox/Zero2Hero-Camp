const { ethers, upgrades } = require("hardhat");

async function main() {
  
  const deployedProxyAddress = "0xe4e9ba7d5c7A74cc4B29B3540Ee23d779142490B";

  const PriceFeedTrackerV2 = await ethers.getContractFactory(
    "PriceFeedTrackerV2"
  );
  console.log("Upgrading PriceFeedTracker...");

  await upgrades.upgradeProxy(deployedProxyAddress, PriceFeedTrackerV2);
  console.log("PriceFeedTracker upgraded");
}

main(); 
