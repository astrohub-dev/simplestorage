// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //The contract address automatically gives us access to its ABI
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }

    function sfAddPerson(uint256 _simpleStorageIndex, uint256 _SsBigNumber, string memory _SsName) public {
        simpleStorageArray[_simpleStorageIndex].addPerson(_SsBigNumber, _SsName);
    }

    function sfGetPerson(uint256 _simpleStorageIndex) public view returns(uint256, string memory) {
        return simpleStorageArray[_simpleStorageIndex].retrievePerson(0);
    }
}