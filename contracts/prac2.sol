// SPDX-License-Identifier: GPL -3.0

pragma solidity >=0.8.2;

contract Example {
    // Note: we get the name come blockchain
string internal MyDogName = "Bingo";
    function getNameOfMyDog() external view returns (string memory) {
        return MyDogName;
    }

    //Note: we change the value of MyDogName variable
    function changeDogName() external {
        MyDogName = "Puppy";
    }

    //Note: we change the value of MyDogName variable again
    function changeNameAgain() external {
        MyDogName = "cowdog";
    }
}
