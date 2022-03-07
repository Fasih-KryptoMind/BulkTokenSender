const owner = "";
const tokenAddress = "";

const Migrations = artifacts.require("MultiSender");

module.exports = function (deployer) {
    deployer.deploy(Migrations, owner, tokenAddress);
};
