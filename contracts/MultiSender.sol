pragma solidity ^0.8.0;

interface Token {
    function transfer(address to, uint256 value) external returns (bool);
}

contract MultiSender {
    
    address public owner;
    address public tokenAddress;
    
    constructor(address _owner, address _tokenAddress) {
        owner = _owner;
        tokenAddress = _tokenAddress;
    }

    function setTokenAddress(address _tokenAddress) public {
        require(msg.sender == owner, "Invalid user");
        tokenAddress = _tokenAddress;    
    }
    
    function multisend(address[] calldata _to, uint256[] calldata _value) external {
        require(msg.sender == owner, "Invalid user");
        assert(_to.length == _value.length);
        // loop through to addresses and send value
        for (uint8 i = 0; i < _to.length; i++) {
            require(Token(tokenAddress).transfer(_to[i], _value[i]), "Multiple token transfer failed");
        }
    }
        
    function tokenWithdrawal(address userAddress, uint256 amount) public {
        require(msg.sender == owner, "Invalid user");
        require(Token(tokenAddress).transfer(userAddress, amount), "Token transfer failed");
    }
}