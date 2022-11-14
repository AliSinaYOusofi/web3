const interaction = artifacts.require("Interaction");

module.exports = function(deployer) {
    deployer.deploy(interaction);
}