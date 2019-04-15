pragma solidity ^0.5.0;

contract transact {
    
    address payable public owner;
    address public buyer;
    
    
    event priceSent(address buyerAddr, uint price);
    event priceReceived(address buyerAddr, uint price);
    
    uint itemPrice;
    
    constructor(address _buyer) public payable {
        owner = msg.sender;
        buyer = _buyer;
        itemPrice = 0;
    }
    
    function sendPrice(uint price) payable public  {
        require (msg.sender == owner);
        itemPrice = price;
        emit priceSent(buyer, price);
    }
    
    function pay() public payable {
        require(buyer == msg.sender);
        require(msg.value == itemPrice);
        owner.transfer(msg.value);
        emit priceReceived(owner, msg.value);
        
    }
}
