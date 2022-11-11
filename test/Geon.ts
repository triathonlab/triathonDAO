/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 11:48:50
 * @LastEditTime: 2022-11-11 14:32:24
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Geon", function () {
  let deployments:any;
  let deployer:any, receiver:any, addr1:any;

  before(async function () {
      [deployer, receiver, addr1] = await ethers.getSigners();
      const deployment = require("../scripts/deployAll");

      deployments = await deployment.execute(deployer, receiver);
  });

  describe("new_mining", async function () {
    it("Should not allow mint without owner", async function () {
        await expect(deployments.geon.connect(receiver).new_mining(10000)).to.be.revertedWith('Access denied');∂∂∂
    })
})
});

