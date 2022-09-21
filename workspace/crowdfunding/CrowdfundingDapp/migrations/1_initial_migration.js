const MigrationsTest = artifacts.require("MigrationsTest");

module.exports = function(deployer) {
  deployer.deploy(MigrationsTest);
};