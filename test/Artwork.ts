/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-10 17:10:19
 * @LastEditTime: 2022-11-11 14:32:07
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Artwork",function(){
    
    let deployments:any;
    let deployer:any, receiver:any;

    before(async function() {
        [deployer, receiver] = await ethers.getSigners();
        const deployment = require("../scripts/deployAll");

        deployments = await deployment.execute(deployer, receiver);
    });
    
    describe("deployment", function () {
        it("Should set the right owner", async function () {
          expect(await deployments.artwork.owner()).to.equal(deployer.address);
        });
    });
    
    describe("mintNFT",function(){
        it("should mint correct NFT",async function(){
            const mint = await deployments.artwork.mintNFT(receiver.address,100);
            await mint.wait();
    
            expect(await deployments.artwork.globalTokenID()).to.equal(100);
            expect(await deployments.artwork.balanceOf(receiver.address)).to.equal(100);
        })
    })
})