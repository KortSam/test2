// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.1;
pragma experimental ABIEncoderV2;
contract CarRegistry {

struct Car {
        string licensePlate;
        string chassisNumber;
        string brand;
        string carType;
        string color;
        string[] pictures;
        uint mileage;
        uint askingPrice;
        address currentOwner;
        bool isForSale;
    }

    mapping(string => Car) cars;
    string[] all_licenceplates;


    function createCar(string memory _licensePlate,string memory _chassisNumber,string memory _brand,string memory _carType,string memory _color,
        string[] memory _pictures) public {
        require(cars[_licensePlate].currentOwner == address(0), "Car already exists");
        Car storage car = cars[_licensePlate];
        car.licensePlate = _licensePlate;
        car.chassisNumber = _chassisNumber;
        car.brand = _brand;
        car.carType = _carType;
        car.color = _color;
        car.pictures = _pictures;
        car.currentOwner = msg.sender;
        car.isForSale = false;
        all_licenceplates.push(_licensePlate);

    }

    function getAllCars() public view returns (string[] memory){
        return all_licenceplates;
    }



    function addMileage(string memory _licensePlate, uint256 _mileage) public {
        cars[_licensePlate].mileage = _mileage;
    }

    function setAskingPrice(string memory _licensePlate, uint _askingPrice) public {
        require(_askingPrice > 0, "askingPrice should be more than 0");
        require(cars[_licensePlate].currentOwner == msg.sender);
        cars[_licensePlate].isForSale = true;
        cars[_licensePlate].askingPrice = _askingPrice;
    }
}


