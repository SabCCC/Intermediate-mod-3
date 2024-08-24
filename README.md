# Intermediate-mod-3
### DESCRIPTION

Here in this code snippet we are going to understand how to work with Solidity and creat different types of functions.

### GETTING STARTED
- Remix Editor

###  Functions
###### Get balance funtion
```
    function getBalance() external view returns (uint){
        return record[msg.sender];
    }
```
###### Mint Function
```
    function mint(address to, uint amount) external {
        require(msg.sender == owner, "Only the owner can mint tokens");
        record[to] += amount;
    }
```
###### Transfer To Function
```
    function transferTo(address to, uint amount) external {
        require(record[msg.sender] >= amount, "Insufficient balance in this account");
        record[to] += amount;
        record[msg.sender] -= amount;
    }
```
###### Burn Function
```
    function burn(uint amount) external {
        require(record[msg.sender] >= amount, "Insufficient balance in this account");
        record[msg.sender] -= amount;
    }
```
###### Transfer Owner Function
```
   
    function transferOwnership(address newOwner) external {
        require(msg.sender == owner, "Only the current owner can transfer ownership");
        require(newOwner != address(0), "New owner address cannot be the zero address");
        owner = newOwner;
    }
```
###### Retrieve Token Funtion
```
    
    function retrieveTokens(address from, uint amount) external {
        require(msg.sender == owner, "Only the owner can retrieve tokens");
        require(record[from] >= amount, "Insufficient balance in the target account");
        record[from] -= amount;
        record[owner] += amount;
    }
}

```

### Authors
- Sabhye Gulati
