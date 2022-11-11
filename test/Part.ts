/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 15:30:59
 * @LastEditTime: 2022-11-11 14:32:56
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Part",function(){
    let deployments:any;
    let deployer:any, receiver:any, addr1:any;

    before(async function () {
        [deployer, receiver] = await ethers.getSigners();
        const deployment = require("../scripts/deployAll");

        deployments = await deployment.execute(deployer, receiver);
    });
    
    describe("deployment", function () {
        it("Should set the right owner", async function () {
          expect(await deployments.part.owner()).to.equal(deployer.address);
    
        });
    });
    
    describe("claim",function(){
        it("should revent with Token ID invalid",async function(){
            await expect(deployments.part.claim(5,100)).to.be.revertedWith('Token ID invalid');
        })
    
        it("should mint part successfully",async function(){
            await deployments.part.claim(0,100);
            expect(await deployments.part.balanceOf(deployer.address,100));
        })
    })
})