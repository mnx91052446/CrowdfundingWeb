const dreamCyut = artifacts.require("DreamCyut.sol");

module.exports = function(deployer) {
  // Command Truffle to deploy the Smart Contract
  deployer.deploy(dreamCyut);
};