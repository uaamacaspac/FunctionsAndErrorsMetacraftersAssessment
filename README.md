# Functions and Errors
This repository was made for a project in Metacrafters where I was required to create a contract with assert(), revert(), and require().

## Description
My contract, Transactions, manages balances associated with addresses and allows users to add to and subtract from their balances. The contract includes functionality for an owner to initialize the contract, add funds, and withdraw funds while ensuring proper checks and balances.

## Functions
     - addition: Adds a specified amount to the sender's balance.
              Requires _amount to be greater than zero.
     - subtraction: Subtracts a specified amount from the sender's balance and sends the corresponding amount to the sender.
              Ensures the sender has enough balance.
     - checkBalance: Returns the balance of the sender.

## IDE
I did not install any specific tools as I was using Remix.

## Compile
The first step to use the contract is to compile it using the Remix IDE. Navigate to the "Solidity Compiler" tab, select the appropriate compiler version (0.8.17), and click the "Compile Transactions.sol" button.

## Deploy
You can deploy the contract by navigating to the "Deploy & Run Transactions" tab in Remix. Ensure the correct contract is selected (Transactions), then click the "Deploy" button. The contract will be deployed with a gas fee using the address specified.

## Run
You can interact with the deployed contract using the functions available under the "Deployed Contracts" section in the "Deploy & Run Transactions" tab. Here, you can call the addition, subtraction, and checkBalance functions to manage and query balances.

## Authors
Uriel Anjelo A. Macaspac





