// SPDC-License-Identifier: MIT
pragma solidity ^0.8.11;

contract VendingMachie {
    // state variables
    address payable public owner;
    mapping (address => uint) public cokeBalances;

/* set the owner as the address that deployed the contract
set the intial vending machine balance to 100 coke */

constructor() {
    owner = payable(msg.sender);
    cokeBalances[address(this)] = 100;
}
function getCokeBalance() public view returns (uint) {
    return cokeBalances[address(this)];
}
function GetContractMoney() public view returns (uint) {
    return address(this).balance;
}
 // Let the owner restock the vending machine with coke amount na how many coke you one add
    // you go require or ask say only owner fit restock
    // then you go add amount to wetin the balance be before
function restock(uint amount) public {
    require(msg.sender == owner, "Only the owner can restock.");
    cokeBalances[address(this)] += amount;
}
// Buy coke from the vending machine
    // put the amount as parameter
    //we one make sure the amount  big pass 2 eth wey buyer put
    //the string na the error wey we go get if the address no get reach the amount
function purchase(uint amount) public payable {
    require(msg.value >= amount * 2 ether, "You must pay at least 2 ETH per donut");
    require(cokeBalances[address(this)] >= amount, "Not enough donuts in stock to complete the purchase");
    cokeBalances[address(this)] -= amount;
    cokeBalances[msg.sender] += amount;
}
//this function go make us fit withdraw the money 
    //e go require say na only owner go be fit call this message with msg.sender
    //we go store all the balance for contract money variable
    //e go require say the money big pass zero to see if peole don pay
function withdrawContractMoney() public {
    
}
}