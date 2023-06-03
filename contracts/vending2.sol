// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract VendingMachine {
    // state variables
    address payable public owner;
    mapping(address => uint) public cokeBalances;

    // set the owner as the address  that deployed the contract
    // set the initial vending machine balance to 100 coke

    constructor() {
        owner = payable(msg.sender);
        cokeBalances[address(this)] = 100;
    }

    function getCokeBalances() public view returns (uint) {
        return cokeBalances[address(this)];
    }

    function getContractMoney() public view returns (uint) {
        return address(this).balance;
    }

    // Let the owner restock the vending machine with coke amount nah how many coke you wan add
    // you go require or ask say only owner fit restock
    //then you go add amount to wetin the balance be before

    function restock(uint amount) public {
        require(msg.sender == owner, "Only the owner can restock");
        cokeBalances[address(this)] += amount;
    }

    // Buy coke from the vending machine
    // Put the amount as parameter
    // we one make sure the amount big pass 2 eth wey buyer put
    // the string na the error wey we go get if the address no get reach the amount
    function purchase(uint amount) public payable {
        require(
            msg.value >= amount * 2 ether,
            "You must pay at least 2 ETH per donut"
        );
        require(
            cokeBalances[address(this)] >= amount,
            "Not enough donuts in stock to complete this purchase"
        );
        cokeBalances[address(this)] -= amount;
        cokeBalances[msg.sender] += amount;
    }

    // this functiongo make us fit withdraw the money
    // e gorequire say nah only owner go be fit call this message with msg.msg.sender
    // we go store all  the balances for contract money variable
    // e go require say the money big pass zero to see if  people don pay
    function withdrawContractMoney() public {
        require(
            msg.sender == owner,
            "Only the contract owner can withdraw the balance"
        );
        uint256 contractMoney = address(this).balance;
        require(contractMoney > 0, "Contract balance is zero");

        (bool success, ) = owner.call{value: contractMoney}("");
        require(success, "Withdrawal failed");
    }
}
