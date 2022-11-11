/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-10 17:43:55
 * @LastEditTime: 2022-11-11 14:32:40
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("NFTAuction", function () {

    let deployments:any;
    let deployer:any, receiver:any, addr1:any;

    before(async function () {
        [deployer, receiver] = await ethers.getSigners();
        const deployment = require("../scripts/deployAll");

        deployments = await deployment.execute(deployer, receiver);
    });

    describe("Ownership", function() {
        it("Should set the right owner", async function () {
            expect(await deployments.nftSellingHull.owner()).to.equal(deployer.address);
        });

        it("Should can be transfer to another", async function () {
            await deployments.nftSellingHull.transferOwnership(receiver.address);
            expect(await deployments.nftSellingHull.owner()).to.equal(receiver.address);
            await deployments.nftSellingHull.connect(receiver).transferOwnership(deployer.address);
            expect(await deployments.nftSellingHull.owner()).to.equal(deployer.address);
        });
    });
});