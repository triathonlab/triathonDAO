/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-10 17:43:55
 * @LastEditTime: 2022-11-10 18:37:24
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("NFTAuction", function () {

    let deployments;
    let deployer, receiver;

    before(async function () {
        [deployer, receiver] = await ethers.getSigners();
        const deployment = require("../scripts/deploy.exe");

        deployments = await deployment.execute(deployer, receiver);
    });

    describe("Ownership", function() {
        it("Should set the right owner", async function () {
            expect(await deployments.nftAuctionHull.owner()).to.equal(deployer.address);
        });

        it("Should can be transfer to another", async function () {
            await deployments.nftAuctionHull.transferOwnership(receiver.address);
            expect(await deployments.nftAuctionHull.owner()).to.equal(receiver.address);
            await deployments.nftAuctionHull.connect(receiver).transferOwnership(deployer.address);
            expect(await deployments.nftAuctionHull.owner()).to.equal(deployer.address);
        });
    });
});