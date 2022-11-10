/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-08 20:13:22
 * @LastEditTime: 2022-11-10 16:02:07
 * @LastEditors: zyq
 * @Reference: 
 */
import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  const deployment = require("./deploy.exe");

  const deployments = {
    trias,
    geon,
    part,
    hull,
    noFreeMint,
    weaponRule,
    weaponHelper,
    ship,
    shipExpand,
    // artwork,
    // baseProperties,
 
    // weaponRule,
    // weaponHelper,

    // triathonBatchTool,
    // nftAuctionPart,
    // nftAuctionHull,
    // nftAuctionShip,
    // nftAuctionArtwork,
    // nftSellingPart,
    // nftSellingHull,
    // nftSellingShip,
    // nftSellingArtwork,
    // shipStakingV2,
    // bscDetectV2,
    // mysteryBox,
    // blindBox,
    // ito,
    // combinShip
  } = await deployment.execute(deployer, undefined);

  console.log("Trias deployed to:", trias.address);
  console.log("Geon deployed to:", geon.address);
  console.log("Part deployed to:", part.address);
  console.log("Hull deployed to:", hull.address);
  console.log("NoFreeMint deployed to:", noFreeMint.address);
  console.log("WeaponRule deployed to:", weaponRule.address);
  console.log("weaponHelper deployed to:", weaponHelper.address);
  console.log("Ship deployed to:", ship.address);
  console.log("shipExpand deployed to:", shipExpand.address);
  // console.log("Artwork deployed to:", artwork.address);
  // console.log("BaseProperties deployed to:", baseProperties.address);
  // console.log("Hull deployed to:", hull.address);
  // console.log("WeaponRule deployed to:", weaponRule.address);
  // console.log("Ship deployed to:", ship.address);
  // console.log("shipExpand deployed to:", shipExpand.address);
  // console.log("triathonBatchTool deployed to:", triathonBatchTool.address);
  // console.log("NFTAuction -> Hull deployed to:", nftAuctionHull.address);
  // console.log("NFTAuction -> Ship deployed to:", nftAuctionShip.address);
  // console.log("NFTAuction -> Artwork deployed to:", nftAuctionArtwork.address);
  // console.log("NFTAuction -> Part deployed to:", nftAuctionPart.address);
  // console.log("NFTSelling -> Hull deployed to:", nftSellingHull.address);
  // console.log("NFTSelling -> Ship deployed to:", nftSellingShip.address);
  // console.log("NFTSelling -> Artwork deployed to:", nftSellingArtwork.address);
  // console.log("NFTSelling -> Part deployed to:", nftSellingPart.address);
  // console.log("ShipStakingV2 deployed to:", shipStakingV2.address);
  // console.log("BlindBox deployed to:", blindBox.address);
  // console.log("mysteryBox deployed to:", mysteryBox.address);
  // console.log("bscDetectV2 deployed to:", bscDetectV2.address);
  // console.log("ITO deployed to:", ito.address);
  // console.log("combinShip deployed to:", combinShip.address);

  // const deployBatchTool = require("./deployBatchTool.exe");
  // const tool = await deployBatchTool.execute(deployer, deployments, deployer.address);
  // console.log("TriathonBatchTool deployed to:", tool.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
