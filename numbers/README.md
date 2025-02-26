# numbers (hardhat) Project

This project demonstrates a basic Hardhat usage and project development.
It comes with a sample contract, a test for that contract, and a simple frontend module
for interacting with the contract through web3 and `ethers.js` Javascript libraries.

# Sepolia deployment

The contract has been already deployed to Sepolia, and it lives under this address:
`0xe86d6525bb7B4d44Cc2470Ac740134301F4Fa230`

You can see it in explorer:
https://sepolia.etherscan.io/address/0xe86d6525bb7B4d44Cc2470Ac740134301F4Fa230


# Web Javascript interaction with the contract

Run

```shell
cd numbers
npx serve frontend
```


# Prerequisites

To play with it using `hardhat`, you will need to have `Node.js` and npm installed on your machine. You can download them from [here](https://nodejs.org/).
Then do:

```shell
cd numbers
npm install
```
This will install all necessary hardhat dependencies.

To compile the contract you can do:
```shell
cd numbers
npx hardhat compile
```

And to run tests:
```shell
cd numbers
npx hardhat test
```

For deployment, you need access to Sepolia blockchain node. The easiest is to use https://infura.io and development API access token that supports that network.
See `hardhat.config.js` file for configuration.


# Extras

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
```
