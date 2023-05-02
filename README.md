# ERC720-Fungible-Token-Standard
ERC720 token standard on the Ethereum test net 

## Description 📌
•	In this project, we will be creating our own Crypt currency token, crypto tokens also called ERC720 smart contracts.
•	But before starting the project we need to understand the difference between a Crypto coin and a Token.
•	COIN: Coins are cryptocurrencies that are native to a specific blockchain, these are coded on the native protocol level of the blockchain and not on the smart contract. Examples: Bitcoin, Ether, and Dogecoin.
•	TOKEN: Tokens are cryptocurrencies that are built on top of an existing blockchain. These are built using ERC-720 smart contracts. Example: Link, Shiba Inu, WBTC.

## ERC20 TOKEN 📌
•	Do you know where the definition "ERC20" comes from? It has an interesting history!
•	Maybe you came across RFC in the world of traditional IT. RFC stands for Request for Comment. And ERC was the early version of this for Ethereum: Ethereum Request for Comment.
•	The number 20 simply refers to the 20th ERC that was posted by someone. That person proposed a general interface for a fungible token.
•	Nowadays the ERCs are called EIPs: Ethereum Improvement Proposals. Because the majority of newcomers did not understand any difference between EIPs and ERCs they were merged. 
•	What's a fungible token? That is, where each token doesn't have any sort of unique serial number and they are all worth equally much. Like Rupee or Dollar coins. You take out the coins in your pocket and 1 Rupee is 1 Rupee, doesn't matter if the coin is old and used or new and shiny.
•	Same as with ERC20. It doesn't matter if you have token #1 or token #1000000, because internally they are not having any serial number and are indistinguishable from each other.
•	It is important to understand the standards to deploy an ERC20 token have already been given in open zeppelin, we need to import these standards and add the additional functionalities that we desire.

## Algorithm
•	This project will be divided into two smart contracts, the First ERC20 contract will oversee all the operations of the Token.
•	The second contract is an Access Control contract that follows Role-based Access control.

## Algorithm for ERC720 📌
1)	Constructor to take the Token name, token symbol, and capped value from the user during the deployment of the contract.
2)	Function to display the above discussed values.
3)	A function to check the balance of all the account, which also needs a mapping to hold the balances.
4)	A transfer function which should be able to transfer specified amount form the “From” address to the “To” address. While making sure all the required conditions are satisfied.
5)	An Allowance function to give allowance to the spenders, the owner can give allowances to different accounts to spend some values.
6)	A Spend Allowance function using which the spends who got the allowance can spend those allowances.
7)	Functions to Increment and Decrement the allowances.
8)	A function to mint new tokens that only the miner role can access.
9)	A function to burn tokens that only the burner role can access.

## Algorithm for Access Control
1)	Constants to hold the role as a Byte32 generated using the Keccak function. We can also use strings but using bytes as a hash saves Gas.
2)	A function to grand role to different accounts.
3)	A function to Revoke the granted roles.

## Technology Stack📌
* Solidity
* Ganache
* Hardhat
* Ether.js
* Remix IDE

## Instructions & Information📌
1) Open [Remix IDE](https://remix.ethereum.org).
2) Create a new folder.
3) Inside the folder, create a solidity file with extension [.sol].
4) Copy paste code from github to the newly created .sol file.
5) Start Ganache.
6) Select Quickstart Ethereum option.
7) In Remix, select DEPLOY & RUN TRANSACTIONS.
8) In Environment dropdown, select Dev - Ganache Provider.
9) In Ganache JSON-RPC Endpoint, enter ganache rpc server. You will find rpc server details in ganache.
10) Compile & Deploy the code in remix.
