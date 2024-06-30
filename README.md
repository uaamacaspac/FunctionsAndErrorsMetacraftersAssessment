# Functions and Errors
This repository was made for a project in Metacrafters where I was required to create a contract with assert(), revert(), and require().

## Description
The SimpleSupplyChain smart contract facilitates a decentralized system for managing product lifecycles on the blockchain. It employs an enum State to represent the current status of products (Created, InTransit, Delivered), and a Product struct to store each product's details including ID, name, state, and owner.

## Functions
### createProduct
Creates a new product and initializes its details.

### startShipping
Initiates the shipping process for a product with "require" to check if a product is in Created state.

### completeDelivery
Marks the delivery of a product as complete which reverts a transaction if the state of the product is Created or Delivered using "revert".

### assertProductState
Checks if a product is in a specific state using "assert".

### revertToCreated
Reverts the state of a product back to Created.

## IDE
I did not install any specific tools as I was using Remix.

## Compile
The first step to use the contract is to compile it using the Remix IDE. Navigate to the "Solidity Compiler" tab, select the appropriate compiler version (0.8.17), and click the "Compile Transactions.sol" button.

## Deploy
You can deploy the contract by navigating to the "Deploy & Run Transactions" tab in Remix. Ensure the correct contract is selected (SimpleSupplyChain), then click the "Deploy" button. The contract will be deployed with a gas fee using the address specified.

## Run
You can interact with the deployed contract using the functions available under the "Deployed Contracts" section in the "Deploy & Run Transactions" tab.

## Authors
Uriel Anjelo A. Macaspac





