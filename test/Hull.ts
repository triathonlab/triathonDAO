/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 17:53:28
 * @LastEditTime: 2022-11-11 14:32:29
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Hull", function () {
    let deployments:any;
    let deployer:any, receiver:any, addr1:any;

    before(async function () {
        [deployer, receiver, addr1] = await ethers.getSigners();
        const deployment = require("../scripts/deployAll");

        deployments = await deployment.execute(deployer, receiver);
    });

    describe("Ownership", function () {
        it("should set the right owner", async function () {
            expect(await deployments.hull.owner()).to.equal(deployer.address);
        });
        it("Should can be transfer to another", async function () {
            await deployments.hull.transferOwnership(addr1.address);
            expect(await deployments.hull.owner()).to.equal(addr1.address);
            await deployments.hull.connect(addr1).transferOwnership(deployer.address);
            expect(await deployments.hull.owner()).to.equal(deployer.address);
        });
    });

    describe("allowMint", function() {
        it("should be true", async function () {
            expect(await deployments.hull.isMiningAllowed()).to.equal(true);
        });
    });

    describe("setAllowMint", function() {
        it("couldn't execute if you are not the owner", async function() {
            await expect(
                deployments.hull.connect(addr1).miningSwitch(false)
            )
            .revertedWith("Ownable: caller is not the owner");
        });
        it("owner could execute", async function() {
            await deployments.hull.miningSwitch(false);
        });
        it("function should be available", async function() {
            expect(
                await deployments.hull.isMiningAllowed()
            )
            .to
            .equal(false);
        });
        it("couldn't execute mint after setAllowMint(false)", async function() {
            await expect(
                deployments.hull.claim("name", "feeling", 1)
            )
            .revertedWith("Mining new TriathonLoot is not allowded now.");
            await deployments.hull.miningSwitch(true);
        });
    });

    describe("mint", function () {
        it("cannot mint with a invalid input", async function () {
            await expect(deployments.hull.claim("name", "feeling", 100)).to.be.revertedWith('input is invalid.');
        })

        it("could mint without trias approving", async function () {
            await deployments.hull.claim("name", "feeling", 1);
            //await expect(deployments.hull.claim("name", "feeling", 1)).to.be.revertedWith('ERC20: transfer amount exceeds allowance');
        })

        it("should mint hull with fee", async function () {
            const approveHull = await deployments.trias.approve(deployments.hull.address, "1000000000000000000000");
            await approveHull.wait();

            const amount = 2000000000000000000;
            for (let i = 1; i < 8; i++) {
                await expect(() => deployments.hull.claim("name" + i, "feeling" + i, i)).to.changeTokenBalances(deployments.trias, [deployer, receiver], [String(-amount), String(amount)]);
                expect(await deployments.hull.mined(deployer.address)).to.equal(i+1);
                const result = await deployments.hull.records(i);
                expect(result["name"]).to.equal("name" + i);
                expect(result["feeling"]).to.equal("feeling" + i);
            }
        })

        it("should mint with right percent", async function () {
            // //generate name string
            // const codeStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789()-_"

            // var destroyer = 0;
            // var delusionist = 0;
            // var daemon = 0;
            // var dungeon = 0;

            // for (let i = 10; i < 5010; i++) {

            //     const digitsNum = Math.floor(Math.random() * 16);
            //     let name = "";
            //     for (let j = 0; j < digitsNum; j++) {
            //         const num = Math.floor(Math.random() * 65);
            //         name = name + codeStr[num];
            //     }

            //     // const feel = Math.floor(Math.random() * 8);
            //     // await hull.mint(name,feel,i)
            //     let className = await deployments.stringsWrapper.getClassName(name);

            //     switch (className) {
            //         case "Destroyer":
            //             destroyer += Number(1);
            //             break;
            //         case "Delusionist":
            //             delusionist += Number(1);
            //             break;
            //         case "Daemon":
            //             daemon += Number(1);
            //             break;
            //         case "Dungeon":
            //             dungeon += Number(1);
            //             break;
            //         default:
            //             break;
            //     }
            // }

            // console.log("Destroyer:", destroyer);
            // console.log("Delusionist:", delusionist);
            // console.log("Daemon:", daemon);
            // console.log("Dungeon:", dungeon);

            // // (2500+10) +- 100
            // expect(BigNumber.from(destroyer)).to.be.within(BigNumber.from(2410), BigNumber.from(2610));

            // // (860+10) +- 100
            // expect(BigNumber.from(delusionist)).to.be.within(BigNumber.from(770), BigNumber.from(870));

            // // (1562+10) +- 100
            // expect(BigNumber.from(destroyer)).to.be.within(BigNumber.from(1472), BigNumber.from(1672));

            // // (78 + 10) +- 50
            // expect(BigNumber.from(destroyer)).to.be.within(BigNumber.from(38), BigNumber.from(138));
        });
    });

    // describe("ownerMint", function() {
    //     it("Couldn't execute if you are not the owner", async function() {
    //         await expect(
    //             deployments.hull.connect(addr1).ownerClaim("name", "feeling", 1, 0)
    //         )
    //         .to
    //         .be
    //         .revertedWith('Ownable: caller is not the owner');
    //     });
    //     it("Owner could execute", async function() {
    //         await deployments.hull.ownerClaim("AAA", "happy", 1, 1);
    //     });
    //     it("Owner could mint whatever of classes if he want", async function() {
    //         await deployments.hull.ownerClaim("AAA", "happy", 1, 0);
    //         const mintedId = (await deployments.hull.globalTokenID()).sub(1);
    //         const class_ = await deployments.hull.getClass(mintedId);
    //         expect(class_).equal("Destroyer");
    //     });
    // });

})
