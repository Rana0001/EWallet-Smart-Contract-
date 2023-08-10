require('dotenv').config()
var TargaryenCoin = artifacts.require("./TargaryenCoin.sol");
const GanacheToGoerliConverter = artifacts.require("GanacheToGoerliConverter");


module.exports = function(deployer, network, accounts) {
  console.log(accounts);
  deployer.deploy(TargaryenCoin);
};


// 2_deploy_contract.js

module.exports = function (deployer, network, accounts) {
  // Replace these addresses with your actual addresses

  module.exports = function (deployer, network, accounts) {
    deployer.deploy(
      GanacheToGoerliConverter,
    );
  };
};
