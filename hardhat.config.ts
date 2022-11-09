/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-08 20:13:22
 * @LastEditTime: 2022-11-09 14:40:44
 * @LastEditors: zyq
 * @Reference: 
 */
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-etherscan";

require('dotenv').config();
// require("dotenv").config();
// require("cryptoenv").parse();

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.0",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.6.0",
        settings: {
          optimizer: {
            enabled: false,
            runs: 200
          }
        }
      },
    ],
  },
  networks: {
    localhost: {
      url: "http://localhost:8546",
      accounts: [`0x${process.env.PRIVATE_LOCAL}`]
    },
    bsc: {
      url: "https://bsc-dataseed1.defibit.io/",
      chainId: 56,
      gasPrice: 20000000000,
      accounts: [`0x${process.env.PRIVATE_BSC}`],
    },
    bscTest: {
      url: "https://data-seed-prebsc-1-s1.binance.org:8545/",
      chainId: 97,
      accounts: [`0x${process.env.PRIVATE_BSC_TEST}`],
    },
    goerliTest: {
      url: "https://goerli.infura.io/v3/",
      chainId: 5,
      accounts: [`0x${process.env.PRIVATE_GOERLI}`]
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
};

export default config;
