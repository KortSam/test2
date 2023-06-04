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
        bool test;
    }

    mapping(string => Car) cars;
    string[] all_licenceplates;
}


