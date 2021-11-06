pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

/* 
Crowdsale.sol allow users to send ETH and collect PUP (PupperCoin).
Will mint the PUP tokens + distribute to buyers in a single transaction.
*/

/* 
Will inherit from Crowdsale, CappedCrowdsale, TimedCrowdsale, RefundableCrowdsale, and MintedCrowdsale.
*/

contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, 
RefundablePostDeliveryCrowdsale {

    constructor(
        // Constructor
        uint rate, 
        address payable wallet, // owner of the sale 
        PupperCoin token, // the PupperCoin token to deploy PupperCoinSale 
        
        // In the original puppercoinsale, close = now + 24 weeks
        // For test only, start = now, close = now + 30 seconds
        uint fakenow,
        uint close,
        
        // Goal set
        uint goal
        
    )
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(goal)
        
        // TimedCrowdsale(open = now, close = now + 30 seconds) in test
        TimedCrowdsale(now, now + 24 weeks)

        RefundableCrowdsale(goal)

        // Pass the constructor 
        public
    {
        // constructor can stay empty
    }
}

contract PupperCoinSaleDeployer {

    address public pupper_token_address;
    address public token_address;

    constructor(
        // Fill in the constructor
        string memory name,
        string memory symbol,
        address payable wallet, // Receive ETH by the sale
        uint goal
        
        // Create a variable called fakenow
        // uint fakenow
    )
        public
    {
        // Create the PupperCoin + address 
        PupperCoin token = new PupperCoin(name, symbol, 0);
        token_address = address(token);

        // Create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 30 seonds for test.
        // PupperCoinSale pupper_token = new PupperCoinSale(1, wallet, token, goal, now, now + 30 seconds) for test;
        PupperCoinSale pupper_token = new PupperCoinSale(
                            1, // 1 wei
                            wallet, // address collecting the tokens
                            token, // token sales
                            goal, // maximum supply of tokens 
                            now, 
                            now + 24 weeks);
                            //replace now by fakenow to get a test function

        // Time forward will deploy now = start time and close time = now + 30 seconds
        // PupperCoinSale pupper_token = new PupperCoinSale(1, wallet, token, goal, now, now + 30 seconds); for testing
        pupper_token_address = address(pupper_token);

        // Make PupperCoinSale contract = minter, then PupperCoinSaleDeployer renounce its minter role
        token.addMinter(pupper_token_address);
        token.renounceMinter();
    }
}
