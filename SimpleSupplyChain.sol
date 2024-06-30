// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleSupplyChain {
    // Enum to represent the different states of a product
    enum State { Created, InTransit, Delivered }
    
    // Struct to store product details
    struct Product {
        uint id; // Product ID
        string name; // Product name
        State state; // Current state of the product
        address owner; // Owner of the product
    }
    
    // Mapping to store products with their IDs
    mapping(uint => Product) public products;
    
    // Counter for product IDs
    uint public productCount;

    // Event to log state changes of a product
    event ProductStateChanged(uint productId, State state);

    // Modifier to check if the caller is the owner of the product
    modifier onlyProductOwner(uint productId) {
        if (productId < productCount) {
            require(msg.sender == products[productId].owner, "Not the product owner");
            _;
        } else {
            require(msg.sender == products[productId].owner, "Product not available.");
            _;
        }
    }

    // Function to create a new product
    function createProduct(string memory name) public {
        productCount++; // Increment the product count
        products[productCount] = Product(productCount, name, State.Created, msg.sender); // Add the new product to the mapping
        emit ProductStateChanged(productCount, State.Created); // Emit event for state change
    }

    // Function to start shipping a product
    function startShipping(uint productId) public onlyProductOwner(productId) {
        Product storage product = products[productId]; // Get the product from the mapping
        require(product.state == State.Created, "Product must be 'Created' to start shipping"); // Check if the product is in 'Created' state
        
        product.state = State.InTransit; // Change the state to 'InTransit'
        emit ProductStateChanged(productId, State.InTransit); // Emit event for state change
    }

    // Function to complete the delivery of a product
    function completeDelivery(uint productId) public onlyProductOwner(productId) {
        Product storage product = products[productId]; // Get the product from the mapping
        if (product.state == State.Created) {
            revert("Product should be in transit for it to be delivered");
        } else if (product.state == State.Delivered) {
            revert("Product has already been delivered");
        } else {
            product.state = State.Delivered; // Change the state to 'Delivered'
            emit ProductStateChanged(productId, State.Delivered); // Emit event for state change
        }
    }

    // Function to assert that a product is in an expected state
    function assertProductState(uint productId, State expectedState) public view {
        Product storage product = products[productId]; // Get the product from the mapping
        assert(product.state == expectedState); // Assert that the product is in the expected state
    }

    // Function to revert the product state to 'Created'
    function revertToCreated(uint productId) public onlyProductOwner(productId) {
        Product storage product = products[productId]; // Get the product from the mapping
        if (product.state != State.Created) { // Check if the product is not in 'Created' state
            product.state = State.Created; // Change the state to 'Created'
        }
    }
}
