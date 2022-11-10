# ![Logo](https://ucarecdn.com/f97d01e4-ef61-4b94-a4e2-2a17f7051da5/image.png) Triathon contracts

Triathon is a decentralized community-driven blockchain and DApp testing framework. Backed by Trias' trusted computing technology, Triathon is designed to be a trusted and reliable blockchain infrastructure and applied to testing and auditing projects before launching. And through community-defined tests, Triathon will connect outstanding projects with funds as well as consensus. 

[Our website](https://www.triathon.space/)

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

* BlindBox.sol: open an blindbox for 4 kinds of NFT described up.
* ShipStaking.sol: stake your Ship NFT to get Geon Token.
* ShipStakingV2.sol: use a different method to calculate the earning to replce ShipStaking.
