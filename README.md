# Joint Savings Account With Solidity

![alt=“”](Execution_Results/savings_account.jpeg)

### Objective

Automation of opening and maintaining joint accounts for any financial institute using solidity smart contract and Ethereum Virtual Machine. The smart contract should be able to accept two user addresses to control the joint account's activity like deposits, withdrawals and checking balance of the funds.

### Smart Contract Features
* `withdraw` 
* `deposit` 
* `contractBalance`:
* Ensure the security of the contract 
* Overdraft protection 

### Planning and Execution:

* Complete and compile `joint_savings.sol` smart contract.

* Deploy the smart contract through JavaScript VM environment in Remix IDE

* A folder named `Execution_Results` that contains the images deposit and withdrawal transactions which are designed to test the `JointSavings` functionality in the JavaScript VM

#### Step 1 (Successful Compilation):

Using Pragma Compiler version ^0.5.0, created a [smart contract](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Final_Code/joint_savings.sol) that contains several functions like withdraw, deposit, balance check, wrong withdrawal address protection, overdraft protection etc. 

![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/1.%20successful_compilation.JPG)



#### Step 2 (Successful Contract Deployment in JavaScript VM)

In this stage we successfully deployed our smart contract using JavaScript VM environment in Remix IDE

![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/2.%20deployed_contract.JPG)


#### Step 3 (Testing & Validation of the Smart Contract)

1. We created two dummy address and set them to be the owner of the contract using `setAccounts` functions. These two addresses now can be used to deposit and withdraw funds from the contract.
* Dummy accountOne address: `0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb`
* Dummy accountTwo address: `0x7A1f3dFAa0a4a19844B606CD6e91d693083B12c0`

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/3.%20two_owners_account_setting.JPG)

2. We have made three consecutive deposit of 1 ETH, 10 ETH and 5 ETH to the contract address and the balance of the contract kept changing and showing final balance after each successful transaction. After the 3rd deposit of 5 ETH, contract balance is showing 16 ETH (balance shown in screenshot is in wei. 1 ETH = 10^18 wei) which seems to be correct proving `deposit` and `contractBalance` function is working correctly.

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/4.%20deposit_one_ether.JPG)

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/5.%20deposit_ten_ether.JPG)

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/6.%20deposit_five_ether.JPG)

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/7.%20checking_before_withdraw.JPG)

3. In this stage we are now testing the withdrawal function. We have made two withdrawal request to `accountOne` & `accountTwo` of 5 ETH and 10 ETH respectively. From the screenshot below we can see that after each succesful withdrawal, the `contractBalance` is showing correct result. Also the `lastToWithdraw` tab is showing correctly last withdrawal address and the `lastWithdrawAmount` tab is showing exactly the amount of last withdrawal. After last withdrawal `contracBalance` is showing balance of 1 ETH which is correct.

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/8.%20withdrawn_five_ether_to_accountOne.JPG)

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/9.%20withdrawn_ten_ether_to_accountTwo.JPG)

4. To test the security of the smart contract, in this stage we tried to withdraw to an address (`0x3b607285E51d85061dB990852B106Da1f6415f40`) which is not set to be the owner. As per contract logic (we used `require` function to implement this), the transaction did not go through despite of having sufficent balance.

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/10.%20failed_withdrawal_wrong_owner.JPG)
    
5. We also tried to withdraw more amount than the available balance of the smart contract. Despite of having the correct `accountOne` address, the transaction did not go through as per contract logic (`require` function)

    ![alt=“”](https://github.com/Ashfaque-Rahman/joint_savings_account_with_solidity/blob/main/Execution_Results/11.%20failed_withdrawal_insufficient_fund.JPG)
