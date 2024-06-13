pragma solidity ^0.8.0;

contract MyToken {
    // Public variables to store token details
    string public tokenName;
    string public tokenAbbrv;
    uint public totalSupply;

    // Mapping of addresses to balances
    mapping (address => uint) public balances;

    // Constructor to initialize token details
    constructor() {
        tokenName = "MyToken";
        tokenAbbrv = "MTK";
        totalSupply = 0;
    }

    // Mint function to increase total supply and balance of an address
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // Burn function to decrease total supply and balance of an address
    function burn(address _address, uint _value) public {
        require(balances[_address] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_address] -= _value;
    }

    // Function to get the balance of an address
    function getBalance(address _address) public view returns (uint) {
        return balances[_address];
    }
}