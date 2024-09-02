// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeliveryOrder {
    struct Order {
        string messageToOwner;
        string shopId;
        string menuId;
        uint256 amount;
        string deliveryAddress;
        string messageToRider;
        uint256 deliveryFee1;
        uint256 deliveryFee2;
        string payment;
    }

    uint256 public orderCount = 0;
    mapping(uint256 => Order) public orders;

    event OrderCreated(
        uint256 indexed orderId,
        string messageToOwner,
        string shopId,
        string menuId,
        uint256 amount,
        string deliveryAddress,
        string messageToRider,
        uint256 deliveryFee1,
        uint256 deliveryFee2,
        string payment
    );

    function createOrder(
        string memory _messageToOwner,
        string memory _shopId,
        string memory _menuId,
        uint256 _amount,
        string memory _deliveryAddress,
        string memory _messageToRider,
        uint256 _deliveryFee1,
        uint256 _deliveryFee2,
        string memory _payment,
        address _recipient
    ) public payable returns (uint256) {
        require(msg.value >= _amount, "Insufficient funds sent");

        orders[orderCount] = Order({
            messageToOwner: _messageToOwner,
            shopId: _shopId,
            menuId: _menuId,
            amount: _amount,
            deliveryAddress: _deliveryAddress,
            messageToRider: _messageToRider,
            deliveryFee1: _deliveryFee1,
            deliveryFee2: _deliveryFee2,
            payment: _payment
        });

        emit OrderCreated(
            orderCount,
            _messageToOwner,
            _shopId,
            _menuId,
            _amount,
            _deliveryAddress,
            _messageToRider,
            _deliveryFee1,
            _deliveryFee2,
            _payment
        );

        (bool sent, ) = _recipient.call{value: msg.value}("");
        require(sent, "Failed to send Ether");

        orderCount += 1;
        return orderCount - 1;
    }

    function getOrder(uint256 _orderId) public view returns (Order memory) {
        return orders[_orderId];
    }
}
