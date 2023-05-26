// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SupplyChain {
    // owner of the contract
    address owner;
    
    // Struct for a item
    struct Item {
        uint id; // item id
        address farmer; // address of the farmer
        uint farmTime; // timestamp when the item was produced
        address wholesaler; // address of the wholesaler
        uint wholesaleTime; // timestamp when the item was wholesaled
        address retailer; // address of the retailer
        uint retailTime; // timestamp when the item was retailed
        address consumer; // address of the consumer
        uint consumeTime; // timestamp when the item was consumed
    }
    
    // mapping item id to Item struct
    mapping (uint => Item) public items;
    
    // event to log all steps
    event LogFarm(uint indexed itemId, address indexed farmer, uint time);
    event LogWholesale(uint indexed itemId, address indexed wholesaler, uint time);
    event LogRetail(uint indexed itemId, address indexed retailer, uint time);
    event LogConsume(uint indexed itemId, address indexed consumer, uint time);
    
    constructor() {
        owner = msg.sender;
    }
    
    // function for the farmer to create an item
    function farmItem(uint itemId) public {
        Item storage item = items[itemId];
        item.id = itemId;
        item.farmer = msg.sender;
        item.farmTime = block.timestamp;
        emit LogFarm(itemId, msg.sender, block.timestamp);
    }
    
    // function for the wholesaler to receive an item
    function wholesaleItem(uint itemId) public {
        Item storage item = items[itemId];
        require(item.farmer != address(0), "Item not farmed yet");
        require(item.wholesaler == address(0), "Item already wholesaled");
        item.wholesaler = msg.sender;
        item.wholesaleTime = block.timestamp;
        emit LogWholesale(itemId, msg.sender, block.timestamp);
    }
    
    // function for the retailer to receive an item
    function retailItem(uint itemId) public {
        Item storage item = items[itemId];
        require(item.wholesaler != address(0), "Item not wholesaled yet");
        require(item.retailer == address(0), "Item already retailed");
        item.retailer = msg.sender;
        item.retailTime = block.timestamp;
        emit LogRetail(itemId, msg.sender, block.timestamp);
    }
    
    // function for the consumer to receive an item
    function consumeItem(uint itemId) public {
        Item storage item = items[itemId];
        require(item.retailer != address(0), "Item not retailed yet");
        require(item.consumer == address(0), "Item already consumed");
        item.consumer = msg.sender;
        item.consumeTime = block.timestamp;
        emit LogConsume(itemId, msg.sender, block.timestamp);
    }
}
