# AgriChain: Blockchain-based Supply Chain Management for Agriculture

## Project Overview
AgriChain is a decentralized application (DApp) built on the Ethereum blockchain. It provides an immutable, transparent, and secure ledger for tracking agricultural products from the farm to the consumer. Using this platform, we ensure complete transparency in terms of product origin, handling, and quality. The stakeholders involved such as farmers, wholesalers, retailers, and consumers, can access and add data to this platform.

## Project Structure
The project consists of a smart contract written in Solidity, the programming language for Ethereum blockchain. The smart contract named "SupplyChain.sol" governs the transactions and movements of agricultural goods within the system.

The main entities of the SupplyChain contract are:
- Farmer
- Wholesaler
- Retailer
- Consumer

The contract ensures that each product is tracked through each stage of the supply chain - farming, wholesaling, retailing, and consumption.

## Contract Details

The contract uses Ethereum's `address` type to represent each entity and uses `uint` to represent timestamps. Each product is represented as an `Item` struct in the contract, and we maintain a mapping of item IDs to their corresponding `Item` struct.

Each action (farming, wholesaling, retailing, and consumption) is a function that can be invoked by the corresponding entity, and this updates the product's information and emits an event with the relevant details.

## Getting Started

To interact with the contract:

1. You will need to have MetaMask installed in your browser and connected to the Rinkeby Test Network.

2. Acquire some Ether (ETH) for the Rinkeby Test Network. You can do this through the Rinkeby Faucet.

3. Deploy the contract to the Rinkeby Test Network. You can use a service like Remix for this.

4. After deploying the contract, you can interact with it using the contract's address and ABI.

## Functions

- `farmItem(uint itemId)`: This function is called by the farmer to create a new item.
- `wholesaleItem(uint itemId)`: This function is called by the wholesaler when they receive the item from the farmer.
- `retailItem(uint itemId)`: This function is called by the retailer when they receive the item from the wholesaler.
- `consumeItem(uint itemId)`: This function is called by the consumer when they receive the item from the retailer.

## Future Enhancements

This is a basic version of a supply chain management system on the blockchain. Future enhancements could include more detailed tracking information, reputation systems for farmers, retailers and wholesalers, integration with IoT for real-time data, and more.

Remember to adhere to local laws and regulations when implementing such a system, as regulations regarding the use of blockchain technology can vary by jurisdiction.

**Note:** This is a basic implementation for demonstration purposes and should not be used as is for production. Always ensure that your contracts are properly audited and tested before deploying them on the mainnet.
