// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

    /// @title This is a swap contract for NFTs (auction would be carried out using the token of the protocol)
    /// @author team unicorn


contract Swap {

    // Declaration of variables
    IERC20 token;
    uint public rate = 10;

    event swapped(address addr, uint amount);


    constructor (IERC20 _token){
        token = _token;
    }

    function swap() public payable {
        require(msg.value > 0, "Not enough balance");
        require(msg.sender != address(0), "Cannot transfer to address zero");

        uint transferrable = msg.value * rate;
        token.transfer(msg.sender, transferrable);

        emit swapped(msg.sender, transferrable);
    }

    receive() external payable{}
}