// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract GanacheToGoerliConverter {
    address public owner;
    address public goerliAddress;
    IERC20 public ganacheToken;

    constructor(address _goerliAddress, address _ganacheTokenAddress) public  {
        owner = msg.sender;
        goerliAddress = _goerliAddress;
        ganacheToken = IERC20(_ganacheTokenAddress);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function setGamacheToken(address gAddress) public {
        ganacheToken = IERC20(gAddress);



    }

    function showBalance() public view{
        uint256 balance = ganacheToken.balanceOf(address(this));
        require(balance > 0, "No balance to convert");
    }

    function convertToGoerli() external onlyOwner {
        uint256 balance = ganacheToken.balanceOf(address(this));
        require(balance > 0, "No balance to convert");

        require(ganacheToken.transfer(goerliAddress, balance), "Transfer to Goerli failed");
    }

    function withdrawTokens(address recipient) external onlyOwner {
        uint256 balance = ganacheToken.balanceOf(address(this));
        require(balance > 0, "No balance to withdraw");

        require(ganacheToken.transfer(recipient, balance), "Transfer failed");
    }

    function setGoerliAddress(address _goerliAddress) external onlyOwner {
        goerliAddress = _goerliAddress;
    }
}
