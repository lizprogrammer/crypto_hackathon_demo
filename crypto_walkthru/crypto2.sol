pragma solidity ^0.4.20;

contract BrooklynToken {
    
    // set the contract owner
    address public owner = msg.sender;
    
    // initialize token name
    string public tokenName;
    
    // intitialize token symbol
    string public tokenSymbol;
    
    // create an array with all balances
    mapping (address => uint256) public balanceOf;
    
    // initialize contract with initial supply of tokens
    // to the contract creator
    function BrooklynToken(uint256 initialSupply, string _tokenName, string _tokenSymbol){
        
        // give the initial supply to the contract owner
        balanceOf[owner] = initialSupply;
        
        // set the tocken name
        tokenName = _tokenName;
        
        // set the token symbol
        tokenSymbol = _tokenSymbol;
    }
    
    // enable the ability to transfer tokens 
    // minimal viable token
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // check if the sender has enough tokens 
        require(balanceOf[msg.sender] >= _value);
        
        // check for integer overflows
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        
        // subtract value from the sender
        balanceOf[msg.sender] -= _value;
        
        // add the value to the recipient
        balanceOf[_to] += _value;
        
        // return whether or not transfer was successful
        return true;
        
    }
    
}
