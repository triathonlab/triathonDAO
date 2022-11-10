/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 15:29:44
 * @LastEditTime: 2022-11-10 20:27:58
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Trias", function () {
  let deployments;
  let deployer, receiver, addr1;

  before(async function () {
      [deployer, receiver, addr1] = await ethers.getSigners();
      const deployment = require("../scripts/deploy.exe");

      deployments = await deployment.execute(deployer, receiver);
  });

  describe("new_mining", async function () {
    it("Should not allow mint without owner", async function () {
        await expect(deployments.trias.connect(receiver).new_mining(10000)).to.be.revertedWith('Access denied');
    })
});

