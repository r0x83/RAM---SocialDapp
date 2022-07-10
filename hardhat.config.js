/**
* @type import('hardhat/config').HardhatUserConfig
*/

require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");


const { API_URL, PRIVATE_KEY, mPOLYGONSCAN_KEY } = process.env;

module.exports = {
   solidity: "0.8.3",
   defaultNetwork: "mumbai",
   networks: {
      hardhat: {},
      mumbai: {
         url: API_URL,
         accounts: [PRIVATE_KEY]
      }
   },
   etherscan: {
      // Your API key for Etherscan
      // Obtain one at https://etherscan.io/
      apiKey: mPOLYGONSCAN_KEY
    },
}