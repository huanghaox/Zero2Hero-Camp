import { ethers } from "hardhat";

async function main() {
  const Implementation = await ethers.getContractFactory("Implementation");
  const implementation = await Implementation.deploy();
  await implementation.deployed();

  
  const Proxy = await ethers.getContractFactory("Proxy");
  const proxy = await Proxy.deploy();
  await proxy.deployed();

  console.log(`Storage deployed to: ${implementation.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
