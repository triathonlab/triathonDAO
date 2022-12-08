# ![Logo](https://ucarecdn.com/f97d01e4-ef61-4b94-a4e2-2a17f7051da5/image.png) Triathon contracts

Triathon is Decentralized Test-driven and Fundraising Platform. 

- Everyone can participate the testing process through entertainment.

- With the help of chaos fuzz automatic test machaine, Triathon can make test cases more efficiency and effective.
- A project is tested in multiple aspects and the testing results can play an important part in making investment decisions for investors.
- With the optimization and improvements on their performance, projects will gain recognition and trust from investors, and participate ITO fundingraising.

[Our website](https://www.triathon.space/)

## Structure

```
.
├── .env.example
├── .gitignore
├── README.md
├── contracts : all contracts
│   ├── Artwork.sol
│   ├── BSCDetectV2.sol
│   ├── Geon.sol
│   ├── Hull.sol
│   ├── NFTAuction.sol
│   ├── NFTSelling.sol
│   ├── NoFreeMint.sol
│   ├── Parts.sol
│   ├── Ship.sol
│   ├── ShipExpand.sol
│   ├── Trias.sol
│   └── artifacts
├── hardhat.config.ts
├── package-lock.json
├── package.json
├── scripts : main deploy script 
│   ├── deploy.ts 
│   └── deployAll.ts
├── test : all test file
│   ├── Artwork.ts
│   ├── BSCDetectV2.ts
│   ├── Geon.ts
│   ├── Hull.ts
│   ├── NFTAuction.ts
│   ├── NFTSelling.ts
│   ├── NoFreeMint.ts
│   ├── Part.ts
│   ├── Ship.ts
│   ├── ShipExpand.ts
│   └── Trias.ts
├── tsconfig.json
└── yarn.lock
```

## Development 

Environment

- Nodejs v14.18.2
- npm 6.14.15
- Hardhat 2.8.3

Add dependencies

```shell
npm install
```

or

```shell
yarn
```

Compile

```shell
npx hardhat compile
```

Test

```shell
npx hardhat test
```

Test with gas report

```shell
REPORT_GAS=true npx hardhat test
```

Deploy

```shell
node scripts/deploy.js
```

Clean

```shell
npx hardhat clean
```

## Advanced Sample Hardhat Project

This project demonstrates an advanced Hardhat use case, integrating other tools commonly used alongside Hardhat in the ecosystem.

The project comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts. It also comes with a variety of other tools, preconfigured to work with the project code.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
npx hardhat help
REPORT_GAS=true npx hardhat test
npx hardhat coverage
npx hardhat run scripts/deploy.js
node scripts/deploy.js
npx eslint '**/*.js'
npx eslint '**/*.js' --fix
npx prettier '**/*.{json,sol,md}' --check
npx prettier '**/*.{json,sol,md}' --write
npx solhint 'contracts/**/*.sol'
npx solhint 'contracts/**/*.sol' --fix
```

# Etherscan verification

To try out Etherscan verification, you first need to deploy a contract to an Ethereum network that's supported by Etherscan, such as Ropsten.

In this project, copy the .env.example file to a file named .env, and then edit it to fill in the details. Enter your Etherscan API key, your Ropsten node URL (eg from Alchemy), and the private key of the account which will send the deployment transaction. With a valid .env file in place, first deploy your contract:

```shell
hardhat run --network ropsten scripts/deploy.js
```

Then, copy the deployment address and paste it in to replace `DEPLOYED_CONTRACT_ADDRESS` in this command:

```shell
npx hardhat verify --network ropsten DEPLOYED_CONTRACT_ADDRESS "Hello, Hardhat!"
```



# Contracts description

Contracts files under the 'contracts' directory are all contracts developed for Triathon Project. They can be devided into serveral kinds as below.

## ERC20 Token

* Trias.sol: ERC20 contract for Trias Token.
* Geon.sol: ERC20 contract for Geon Token.

## NFT

* Hull.sol: an ERC721 nft like 'loot'
* Part.sol: an ERC1155 nft, also like 'loot' with only five kinds.
* Ship.sol: an ERC721 nft composed by one or more Hull and Parts.
* Artwork.sol: an ERC721 nft, currently only one triape.

## Market

* NFTAuction.sol: sell nft in an auction mode.
* NFTSelling.sol:  sell nft with a fixed price.

## Activity

* BSCDetectV2.sol: use a different method to calculate the earning to replace ShipStaking.

## Staking reward

- NFT staking rewards are determined based on the number of spaceships staked by users (M0).

- Rewards are issued once a day, and the total amount of GEON tokens generated is M0*fixed coefficient.

- The reward ratio is determined by the following factors：

  [1]、Component (parts) energy: number of parts×100×20%

  [2]、LV (Level) energy: Level value x40%

  [3]、CE (Combat Effectiveness): Combat Strength x10%

  [4]、HP(Health points) energy: HP value x10%

  [5]、Category energy: Category value x20%

- NFT energy value = parts energy + LV energy + CE energy + HP energy + category energy
  Single NFT test reward = single NFT energy value / total energy value of all NFTs * NFT number * 350
  
  Triathon official mailbox：triathonspace@gmail.com
