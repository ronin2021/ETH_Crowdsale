# ETH_Crowdsale

Using standardized implementations setting up a crowdsale with inted tokens. 

## Outline

Code implements and automates a crowdsale via PupperCoin tokens which will have initial minting capcit of 1000. It is set toraise 300 ETH for the entity running the crowd sale. 

## Implementation 

### Contract has following imports for implementing the PupperCoin.sol:

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

### Contract has the following importas for implementing CrowdSale.sol

import "./PupperCoin.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

## Process

We deployed PupperCoin contract - on Remix:

![1_PupperCoin_Deployment_Remix](Images/1_PupperCoin_Deployment_Remix.png)

Deployed PupperCoin contract step - on MetaMask:

![2_PupperCoin_Deployment_MetaMask](Images/2_PupperCoin_Deployment_MetaMask.png)

We implemented minting PupperCoin as shown on the Remix:

![3_PupperCoin_Minting_Remix](Images/3_PupperCoin_Minting_Remix.png)

Minting implementation as shown on MetaMask:

![4_PupperCoin_Minting_MetaMask](Images/4_PupperCoin_Minting_MetaMask.png)

Minted PupperCoins as shown on Remix:

![5_PupperCoin_Minted_Tokens_Remix](Images/5_PupperCoin_Minted_Tokens_Remix.png)

Deploying PupperCoinSaleDeployer in Remix:

![6_PupperCoinSaleDeployer_Deployed_Remix](Images/6_PupperCoinSaleDeployer_Deployed_Remix.png)

Middle step in PupperCoinSaleDeployer in MetaMask:

![7_PupperCoinSaleDeployer_Deployed_MetaMask](Images/7_PupperCoinSaleDeployer_Deployed_MetaMask.png)

### Technologies implemented
ERC20 FT were implemented with standard Blockchain and smartcontract development via Solidity, Remix IDE, MetaMask, and Ganache (local blockchain).

### Inputs
Pre loaded test ETH in local accounts handled via MetaMask and Ganache. 
At onset 1000 PupperCoin Tokens were minted for the crowd sale.

### Outputs
Outputs are presented as graphics of the Remix and MetaMask. 

### Remarks
None.

