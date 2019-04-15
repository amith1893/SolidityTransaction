pragma solidity ^0.5.0;

contract transact {
    
    //Both the buyer and seller are initialised by the variable type of address 
    //because each of them represent nodes in the blockchain. 
    //More specifically, they represent different VMs in the Ethereum.
    address payable public owner; //it is payable as the owner will be payed by the buyer
    address public buyer;
    
    
    event priceSent(address buyerAddr, uint price);
    event priceReceived(address buyerAddr, uint price);
    
    uint itemPrice;
    
    
    //The owner of the transaction is the one who deploys the contract in the blockchain. He is also the seller of the item.
    //The buyer of the transaction is the one who the owner wants to sell the item to.
    constructor(address _buyer) public payable {
        owner = msg.sender;
        buyer = _buyer;
        itemPrice = 0;
    }
   
   
   
   //Verifies if the seller of the item for a particular price is the owner.    
   //Only if it is the owner, then the price for which the item needs to be sold will be stored in the state variable called itemPrice.
   //An event will be registered indicating that the owner would want to sell the item to the buyer.
   function sendPrice(uint price) payable public  {
        require (msg.sender == owner);
        itemPrice = price;
        emit priceSent(buyer, price);
    }
    
    
   //Verifies if the buyer of the item is actually the buyer the owner wants to sell the item to initially.
   //If the above condition is true, then it verifies if the buyer is buying the item for the same price the seller asked for.
   //If the above two conditions are true, then the amount is transferred to the seller using the transfer function.
   //An event will be registered indicating that the owner has been paid the amount by the buyer.
    function pay() public payable {
        require(buyer == msg.sender);
        require(msg.value == itemPrice);
        owner.transfer(msg.value);
        emit priceReceived(owner, msg.value);
        
    }
}
