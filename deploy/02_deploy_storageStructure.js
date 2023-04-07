import { DeployFunction } from "hardhat-deploy/dist/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";
import { readAddressList, storeAddressList } from "../scripts/helper";

const func = async function (hre) {
  const { deployments, getNamedAccounts, network } = hre;
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();

  const addressList = readAddressList();

  const storageStructure = await deploy("StorageStructure", {
    contract: "StorageStructure",
    from: deployer,
    args: [],
    log: true,
  });
  console.log("StorageStructure deployed to:", storageStructure.address);

  addressList[network.name].StorageStructure = storageStructure.address;
  storeAddressList(addressList);
};

func.tags = ["StorageStructure"];
export default func;