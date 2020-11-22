var HodlDexProxy = artifacts.require("./HODL2_patch1/contracts/HodlDexProxy.sol");
var HodlDex = artifacts.require("./HODL2_patch1/contracts/HodlDex.sol");

module.exports = async (config) => {
    let accounts = await web3.eth.getAccounts();
    console.log("TESTING 1234")
    var dp = await HodlDexProxy.deployed()
    console.log("HodlDexProxy address: " + dp.address)

    var dex = await HodlDex.at(dp.address)

    console.log("Dex address: " + dex.address)

    await dex.oracleSetEthUsd("375000000000000000000")

    console.log("ETH USD VALUE SET")

    var role = await dex.MIGRATION_ROLE()

    console.log("Migration Role Set")
    console.log("Account 0: " + accounts[0])
    await dex.revokeRole(role,accounts[0])

    console.log("Migration Role revoked")

    var running = await dex.isRunning()

    console.log("Is running: " + running)
}
