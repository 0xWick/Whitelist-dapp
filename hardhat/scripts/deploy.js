const { ethers } = require("hardhat")

async function main() {

    /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */
    const whitelistContract = await ethers.getContractFactory("Whitelist");

    // Deploying the contract
    const deployedWhitelistContract = await whitelistContract.deploy(10); // 10 is the number of addresses allowed to be whitelisted

    // wait for it to finish deploying
    await deployedWhitelistContract.deployed();

    console.log(
        "Whitelist Contract Address",
        deployedWhitelistContract.address
    );
}

// Calling the "Main" Function and catching any errors

main().
    then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    })

