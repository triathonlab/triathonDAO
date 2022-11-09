/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 11:48:50
 * @LastEditTime: 2022-11-09 15:14:18
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Geon", function () {
  let deployments;
  let deployer, receiver, addr1;

  before(async function () {
      [deployer, receiver, addr1] = await ethers.getSigners();
      const deployment = require("../scripts/deploy.exe");

      deployments = await deployment.execute(deployer, receiver);
  });

  describe("new_mining", async function () {
    it("Should not allow mint without owner", async function () {
        await expect(deployments.geon.connect(receiver).new_mining(10000)).to.be.revertedWith('Access denied');
        await expect(deployments.trias.connect(receiver).new_mining(10000)).to.be.revertedWith('Access denied');
    })
})
});

