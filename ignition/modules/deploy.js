const hre = require("hardhat");

async function main() {
  //compile the contract to get the latest bytecode and ABI
  await hre.run("compile");

  //get the smart contract
  const Zenzone = await hre.ethers.getContractFactory("zenzone");

  //deploy the dAppify smart contract
  const deployedZen = await Zenzone.deploy();
  await deployedZen.waitForDeployment();
  console.log("zenzone deployed to:", await deployedZen.getAddress());

  // function add inital data
  
}

//handle errors from main()
main().catch((error) => {
  console.error(error);
  process.exit(1);
});