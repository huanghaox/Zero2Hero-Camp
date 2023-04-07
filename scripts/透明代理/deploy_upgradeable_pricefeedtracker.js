
const { ethers, network, upgrades } = require("hardhat");

async function main() {
//创建合约
 const PriceFeedTracker = await ethers.getContractFactory("PriceFeedTracker");
 console.log("Deploying PriceFeedTracker to ", network.name);
//获取用户签名
 const [owner] = await ethers.getSigners();

 // 使用代理模式部署逻辑合约。
 const pricefeedTracker = await upgrades.deployProxy(
   PriceFeedTracker,
   [owner.address],
   { initializer: "initialize" }
 );
 await pricefeedTracker.deployed();

 console.log("PriceFeedTracker deployed to:", pricefeedTracker.address);
}

main();
