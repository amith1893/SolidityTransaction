# SolidityTransaction

This repository consists of a solidity file called transact.sol.

It represents a simple transaction involving buying and selling of an item in the blockchain.

## Structure of the contract

1. The transaction of buying and selling and the corresponding state variables involved during the process is encapsulated in the form of a contract called transact

2. A constructor which initialises the owner of the transaction and the buyer. 

      a. The owner of the transaction is the one who deploys the contract in the blockchain. He is also the seller of the item.  
      b. The buyer of the transaction is the one who the owner wants to sell the item to.

3. sendPrice function does the following:

      a. Verifies if the seller of the item for a particular price is the owner.  
      b. Only if it is the owner, then the price for which the item needs to be sold will be stored in the state variable called itemPrice.  
      c. An event will be registered indicating that the owner would want to sell the item to the buyer.

4. pay function does the following:

      a. Verifies if the buyer of the item is actually the buyer the owner wants to sell the item to initially.  
      b. If the above condition is true, then it verifies if the buyer is buying the item for the same price the seller asked for.  
      c. If the above two conditions are true, then the amount is transferred to the seller using the transfer function.  
      d. An event will be registered indicating that the owner has been paid the amount by the buyer.
      
5. Both the buyer and seller are initialised by the variable type of address because each of them represent nodes in the blockchain. More specifically, they represent different VMs in the Ethereum.

## Execution of the solidity application

1. Open <a href="https://remix.ethereum.org/#optimize=false&version=soljson-v0.5.6+commit.b259423e.js">Remix</a>

2. Click on the '+' sign in the top left corner of the page to create a new solidity file.

3. Choose the compiler version  greater than "0.5.0" in the dropdown menu on the top right side of the page.

4. After naming the new file created, add the following line in the first line of the file.  

        pragma solidity ^0.5.0;

5. Copy the contents of the file in this github repository to the new file created in Remix.

6. In order to compile the file, Ctrl + S needs to be done.

7. After compilation, chose the Run tab on the right top side of the page. 

8. Under the Run tab, before deploying the contract, we need to chose a buyer from the drop down menu of Account. This represents the buyer whom the seller wants to sell the item to. Copy the address of the buyer and paste it in the "_buyer" variable. 

9. Chose the owner again from the dropdown menu of Account.

10. Now, we can deploy the contract.

11. Once the contract is deployed, we can chose the contract deployed under the Deployed Contracts section. 

12. On clicking the deployed contract, we can provide a parameter for the sendPrice function indicating the price for which the owner wants to sell the item for. After providing the parameter, we can click on the sendPrice function. 

13. As a result of executing the sendPrice function, a transaction is recorded and added to the blockchain. More details of the transaction can be found in the logs at the bottom of the page. 

14. In order to buy the item, we need to chose the same buyer account from the Account menu which we had given while deploying the contract. 

15. We can provide the same amount in the value field in the top right corner of the page under the Run tab and then click on Pay function of the deployed contract.

16. The above transaction will be successful.

17. In order to execute different testcases:  

       a. We can chose any other account apart from the buyer account initially registered. We will see that the transaction fails.  
       b. We can chose the same buyer acccount initially registered and provide different values in the Value field different from the value required to buy the item. We will see that the transaction fails.  
        
  
