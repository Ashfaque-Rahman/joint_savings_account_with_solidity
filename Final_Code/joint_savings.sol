/*
Joint Savings Account
---------------------

To automate the creation of joint savings accounts, need to create a solidity smart contract that accepts two user addresses that are then able to control a joint savings account. The smart contract will use ether management functions to implement various requirements from the financial institution to provide the features of the joint savings account.

Work Flow:

1. Create and work within a local blockchain development environment using the JavaScript VM provided by the Remix IDE.

2. Script and deploy a **JointSavings** smart contract.

3. Interact with the deployed smart contract to transfer and withdraw funds.

*/

pragma solidity ^0.5.0;

// Defining a new contract named `JointSavings`
contract JointSavings {

    // Declaring variables
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

    // Defining a function with two arguments
    function withdraw(uint amount, address payable recipient) public {

        // Defining a require statement to ensure owner is making the request
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");

        // Ensuring sufficient balance availabilty to transact
        require(contractBalance >= amount, "Insufficient funds!");

        // Setting last withdrawal address to currenct reciepient
        if (lastToWithdraw != recipient){
            lastToWithdraw = recipient;
        }
        recipient.transfer(amount);
        lastWithdrawAmount = amount;
        contractBalance = address(this).balance;
    }

    // Defining a `public payable` function named `deposit`.
    function deposit() public payable {
        contractBalance = address(this).balance;
    }

    // Defining a setter function to set initial two account owner address
    function setAccounts(address payable account1, address payable account2) public{
        accountOne = account1;
        accountTwo = account2;
    }

    // setting default "Fall Back Function" to receive deposit outside of contract address
    function() external payable {}
}
