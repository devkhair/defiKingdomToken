const hre = require("hardhat");

async function main() {
  // Get the Points smart contract
  const Token = await hre.ethers.getContractFactory("DEFIEMPIRE");

  // Deploy it
  const token = await Token.deploy();
  await token.deployed();

  // Display the contract address
  console.log(`token deployed to ${token.address}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
