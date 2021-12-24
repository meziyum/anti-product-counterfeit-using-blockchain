var Products = artifacts.require("./Products.sol");

module.exports = function(deployer) {
  deployer.deploy(Products);
};