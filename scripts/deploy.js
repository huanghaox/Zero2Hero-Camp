require("ethers")
async function main() {
  const ImplementationV1 = await ethers.getContractFactory("ImplementationV1");
  const implementationV1 = await ImplementationV1.deploy();
  await implementationV1.deployed();
  console.log(`implementationV1 deployed to: ${implementationV1.address}`);

  const ImplementationV2 = await ethers.getContractFactory("ImplementationV2");
  const implementationV2 = await ImplementationV2.deploy();
  await implementationV2.deployed();
  console.log(`implementationV2 deployed to: ${implementationV2.address}`);

  
  const Proxy = await ethers.getContractFactory("ProxyContract");
  const proxy = await Proxy.deploy();
  await proxy.deployed();
  console.log(`proxy deployed to: ${proxy.address}`);

  await proxy.upgradeTo(implementationV1.address);
  
  const Caller = await ethers.getContractFactory("Caller");
  const caller = await Caller.deploy(proxy.address);
  await caller.deployed();
  console.log(`caller deployed to: ${proxy.address}`);

   await caller.initialize()
  await caller.addTotal()
   const v1Total = await caller.getTotal()
  console.log(`v1Total to: ${v1Total}`);

  await proxy.upgradeTo(implementationV2.address);

  await caller.addTotal()
  const v2Total = await caller.getTotal()
  console.log(`v2Total to: ${v2Total}`);


}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
