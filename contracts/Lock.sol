// sample 코드 
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
// Uncomment this line to use console.log
// import "hardhat/console.sol";
contract Lock {
    uint public a;
    function getA() public view returns(uint) {
        return a;
    }
    function setA(uint _a) public {
        a = _a;
    }
    function setA2(uint _a) public {
        a = _a*2;
    }
}

/*pragma solidity ^0.5.16;

contract FoodDelivery {
    struct Order {
        address customer;
        string restaurant;
        string menu;
        uint256 price;
    }

    Order[] public orders;

    function createOrder(string memory _restaurant, string memory _menu, uint256 _price) public {
        orders.push(Order(msg.sender, _restaurant, _menu, _price));
    }

    function getOrder(uint _orderId) public view returns (address, string memory, string memory, uint256) {
        Order memory _order = orders[_orderId];
        return (_order.customer, _order.restaurant, _order.menu, _order.price);
    }
}*/
