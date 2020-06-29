pragma solidity ^0.6.6;

contract BikeParkDice
{
    // The only function for this contract
    // It uses some seed data and a hash to return a "random" number from 1-6
    function rollDice() public view returns(uint256 final_roll)
    {
        
        // Get the sending address, block difficulty, and block timestamp
        // to give us a good enough "seed" for our pseudo-random number
        bytes32 seed = keccak256(abi.encodePacked(msg.sender));
        bytes32 seed_2 = keccak256(abi.encodePacked(block.difficulty));
        bytes32 seed_3 = keccak256(abi.encodePacked(block.timestamp));
        
        // Hash the seed data. This keccak hash is deterministic (necessary for Ethereum contracts!)
        // and is preimage resistant, which is helpful for our pseudo-random generation
        bytes32 hash = keccak256(abi.encodePacked(seed, seed_2, seed_3));
        
        // Cast the hash bytes to an integer value
        uint256 hash_num = uint256(hash);
        
        // Return a number from 1-6 by using the modulo (remainder) function
        final_roll = (hash_num % 6) + 1;
        return final_roll;
        
    }
}