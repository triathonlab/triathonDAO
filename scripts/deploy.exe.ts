/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 14:57:21
 * @LastEditTime: 2022-11-10 18:36:03
 * @LastEditors: zyq
 * @Reference: 
 */
import { ethers } from "hardhat";

async function deploy(deployer, receiver = undefined) {
    if (receiver == undefined) {
        receiver = deployer;
    }

    // Trias
    const Trias = await ethers.getContractFactory("TriasOnBSC");
    const trias = await Trias.deploy('trias', 'TRIAS', 1000000000);
    await trias.deployed();

    // Geon
    const Geon = await ethers.getContractFactory("Geon");
    const geon = await Geon.deploy('geon', 'GEON', 1000000000);
    await geon.deployed();

    // Part
    const Part = await ethers.getContractFactory("ToolsLoot");
    const part = await Part.deploy();
    await part.deployed();

    // library BaseProperties
    const BaseProperties = await ethers.getContractFactory("BaseProperties");
    const baseProperties = await BaseProperties.deploy();
    await baseProperties.deployed();

    // Hull
    const Hull = await ethers.getContractFactory(
        "contracts/Hull.sol:TriathonLoot",
        {
            libraries: {
                BaseProperties: baseProperties.address,
            },
        });
    const hull = await Hull.deploy(trias.address, receiver.address);
    await hull.deployed();

    // NoFreeMint
    const NoFreeMint = await ethers.getContractFactory("NoFreeMint");
    const noFreeMint = await NoFreeMint.deploy(trias.address,hull.address);
    await noFreeMint.deployed();

     // weaponRule
     const WeaponRule = await ethers.getContractFactory("WeaponRule");
     const weaponRule = await WeaponRule.deploy();
     await weaponRule.deployed();
 
     await weaponRule.setRule(222,"Delusionist","Fuzz Testing",[2,0,0,0,4],"https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/222.png");
     await weaponRule.setRule(362,"Destroyer","Network Attack",[0,0,4,0,0],"https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/362.png");
     await weaponRule.setRule(238,"Daemon","Network Interruptions",[1,0,0,4,0],"https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/238.png");
 
     // WeaponHelper
     const WeaponHelper = await ethers.getContractFactory("WeaponHelper");
     const weaponHelper = await WeaponHelper.deploy(hull.address, baseProperties.address, part.address, weaponRule.address, receiver.address, geon.address);
     await weaponHelper.deployed();
 
    //  await hull.setApprovalForAll(weaponHelper.address,true);
    //  await part.setApprovalForAll(weaponHelper.address,true);
 
     // Ship
     const Ship = await ethers.getContractFactory(
         "Weapons",
         // {
         //     libraries: {
         //         Base64: base64.address
         //     }
         // }
     );
     const ship = await Ship.deploy(weaponRule.address,weaponHelper.address);
     await ship.deployed();
 
     const ShipExpand = await ethers.getContractFactory("ShipExpand");
     const shipExpand = await ShipExpand.deploy(geon.address, deployer.address,deployer.address);
     await shipExpand.deployed();

      // Artwork
    const Artwork = await ethers.getContractFactory("ArtworkNFT");
    const artwork = await Artwork.deploy("Triape NFT", "TRIAPE");
    await artwork.deployed();

    // NFTAuction --> Hull
    const NFTAuction = await ethers.getContractFactory("TriathonAuction");
    let nftAuctionHull = await NFTAuction.deploy(trias.address, hull.address, receiver.address);
    await nftAuctionHull.deployed();

   

    return {
        trias,
        geon,
        part,
        hull,
        noFreeMint,
        weaponRule,
        weaponHelper,
        ship,
        shipExpand,
        artwork,
        nftAuctionHull
    };
}

let openPrint = false;

function print(anything) {
    if (openPrint) {
        console.log(anything);
    }
}

exports.execute = async function execute(deployer, receiver = undefined) {
    return await deploy(deployer, receiver);
}