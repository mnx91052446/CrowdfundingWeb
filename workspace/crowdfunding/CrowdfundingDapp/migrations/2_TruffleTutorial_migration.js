const TruffleTutorialTest = artifacts.require("TruffleTutorialTest.sol");

module.exports = function(deployer) {
  // Command Truffle to deploy the Smart Contract
  deployer.deploy(TruffleTutorialTest);
};

