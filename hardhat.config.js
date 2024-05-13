require("@nomicfoundation/hardhat-toolbox");
const fs = require('fs');
const keys = JSON.parse(fs.readFileSync('key.json', 'utf-8'));
/** @type import('hardhat/config').HardhatUserConfig */
/*module.exports = {
  solidity: "0.8.24",
};*/

module.exports = {
  solidity: "0.8.9",
  paths: {
    sources: "./contracts",
        tests: "./Lock",
        cache: "./cache",
        artifacts: "./artifacts"
  },
  networks: {
    matic_testnet: {
      url: `https://polygon-amoy.infura.io/v3/${keys.infuraProjectId}`,
      accounts: [keys.privateKey],
      gasPrice: 30000
    },
  },
};