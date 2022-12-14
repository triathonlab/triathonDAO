/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 20:23:25
 * @LastEditTime: 2022-11-11 14:32:46
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("NoFreeMint", function () {
  let deployments:any;
  let deployer:any, receiver:any, addr1:any;

  before(async function () {
      [deployer, receiver, addr1] = await ethers.getSigners();
      const deployment = require("../scripts/deployAll");

      deployments = await deployment.execute(deployer, receiver);
  });

  describe("No Free Mint", async function () {
    it("could mint without trias approving", async function () {
         await expect(deployments.noFreeMint.claim("name", "feeling", 1)).to.be.revertedWith('ERC20: transfer amount exceeds allowance');
        })
    })
});