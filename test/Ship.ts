/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-10 16:00:35
 * @LastEditTime: 2022-11-11 14:33:01
 * @LastEditors: zyq
 * @Reference: 
 */

import { expect } from "chai";
import { ethers } from "hardhat";

describe("Ship", function () {

    let deployments:any;
    let deployer:any, receiver:any, addr1:any;

    before(async function () {
        [deployer, receiver, addr1] = await ethers.getSigners();
        const deployment = require("../scripts/deployAll");

        deployments = await deployment.execute(deployer, receiver);
    });

    describe("Ownership", function () {
        it("Should set the right owner", async function () {
            expect(await deployments.ship.owner()).to.equal(deployer.address);
        });
        it("Should can be transfer to another", async function () {
            await deployments.ship.transferOwnership(addr1.address);
            expect(await deployments.ship.owner()).to.equal(addr1.address);
            await deployments.ship.connect(addr1).transferOwnership(deployer.address);
            expect(await deployments.ship.owner()).to.equal(deployer.address);
        });
    });

    // describe("Prepare For Ship", function () {

    //     it("should mint hull free", async function () {
            
    //     });

    //     it("should mint hull for ship with fee", async function () {
    //         // for (let i = 1; i < 8; i++) {
    //         //     await expect(() => deployments.hull.claim("name" + i, "feeling" + i, i)).to.changeTokenBalances(deployments.trias, [deployer, receiver], [String(-amount), String(amount)]);
    //         // }
    //     })

    //     it("should mint part for ship", async function () {
            
    //     })
    // })

    describe("creat", function () {

        let destroyerId;

        it("prepare", async function() {
            // approve
            const approveHull = await deployments.trias.approve(deployments.hull.address, "1000000000000000000000");
            await approveHull.wait();

            await deployments.hull.miningSwitch(true);

            // mint hull
            for (let i = 1; i < 8; i++) {
                await deployments.hull.claim("name" + i, "feeling" + i, i);
            }

            // Destroyer
            await deployments.hull.claim("AAA", "happy", 1);
            destroyerId = (await deployments.hull.globalTokenID()).sub(1);
            // const class_ = await deployments.hull.getClass(destroyerId);
            // console.log("minted class is: " + class_);

            // mint part for ship
            await deployments.part.claim(0, 100);
            await deployments.part.claim(1, 100);
            await deployments.part.claim(2, 100);
            await deployments.part.claim(3, 100);
            await deployments.part.claim(4, 100);
        });

        it("should revert 'rule error' if it's not match part and hull", async function () {
            await expect(
                deployments.ship.create(79, destroyerId)
            )
            .revertedWith('unallowded using this loot nft to compose this poly nft.');
        });

        it("should be reverted if you don't approve hull", async function () {
            await expect(
                deployments.ship.create(33, destroyerId)
            )
            .revertedWith('ERC721: transfer caller is not owner nor approved');

            await deployments.hull.setApprovalForAll(deployments.weaponHelper.address,true);
        });

        it("should be reverted if you don't approve part", async function () {
            //await deployments.hull.approve(deployments.ship.address, destroyerId);
            await expect(
                deployments.ship.create(33, destroyerId)
            )
            .revertedWith('ERC1155: caller is not owner nor approved');

            await deployments.part.setApprovalForAll(deployments.weaponHelper.address, true);
        });

        it("should create successfully", async function () {
            await deployments.ship.create(33, destroyerId);
        });

        it("should send ERC1155 and ERC721 transfer successfully", async function () {
            // await deployments.part.setApprovalForAll(deployments.ship.address, true);
            // //preset rule
            // const presetRule = new Array(79, 81, 33, 384, 210, 267, 155, 176, 315);
            // const presetNFT = new Array(0, 1, 2, 3, 4, 5, 6, 7);

            // // approve ERC1155 to ship
            // for (var j in presetNFT) {
            //     await deployments.hull.approve(deployments.ship.address, presetNFT[j]);
            // }

            // // mint ship
            // for (var i in presetRule) {
            //     const asmRule = await deployments.shipRule.asmRules(presetRule[i]);
            //     //console.log(asmRule.class);
            //     for (var j in presetNFT) {

            //         const nft = await deployments.hull.records(presetNFT[j]);
            //         const nftName = await deployments.stringsWrapper.getClassName(nft.name);
            //         const className = asmRule.class;
            //         const presetNFTj = await deployments.ship.weapons(presetNFT[j])


            //         if (nftName == className && presetNFTj.pic_id == 0) {
            //             const wings = await deployments.part.balanceOf(receiver.address, 0);
            //             const guns = await deployments.part.balanceOf(receiver.address, 1);
            //             const cannons = await deployments.part.balanceOf(receiver.address, 2);
            //             const armors = await deployments.part.balanceOf(receiver.address, 3);
            //             const lasers = await deployments.part.balanceOf(receiver.address, 4);

            //             // console.log("wings:",wings,"guns:",guns,"cannons:",cannons,"armors:",armors,"lasers:",lasers);

            //             await deployments.ship.create(presetRule[i], presetNFT[j]);

            //             const rules = await deployments.shipRule.getRuleParts(presetRule[i]);
            //             // console.log("rules:",rules);

            //             // const nowWings = await part.balanceOf(receiver.address,0);
            //             // const nowGuns = await part.balanceOf(receiver.address,1);
            //             // const nowCannons = await part.balanceOf(receiver.address,2);
            //             // const nowArmors = await part.balanceOf(receiver.address,3);
            //             // const nowLasers = await part.balanceOf(receiver.address,4);
            //             // console.log("nowWingswings:",nowWings,"nowGuns:",nowGuns,"nowCannons:",nowCannons,"nowArmors:",nowArmors,"nowLasers:",nowLasers);

            //             expect(await deployments.part.balanceOf(receiver.address, 0)).to.equal(wings.add(rules[0]));
            //             expect(await deployments.part.balanceOf(receiver.address, 1)).to.equal(guns.add(rules[1]));
            //             expect(await deployments.part.balanceOf(receiver.address, 2)).to.equal(cannons.add(rules[2]));
            //             expect(await deployments.part.balanceOf(receiver.address, 3)).to.equal(armors.add(rules[3]));
            //             expect(await deployments.part.balanceOf(receiver.address, 4)).to.equal(lasers.add(rules[4]));

            //             console.log(presetRule[i], presetNFT[j]);
            //             break;
            //         }
            //     }
            // }
        });
    });
});