/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-10 19:00:39
 * @LastEditTime: 2022-11-10 20:45:26
 * @LastEditors: zyq
 * @Reference: 
 */
import { expect } from "chai";
import { ethers } from "hardhat";

describe("BSCDetectV2", function () {
    let deployments;
    let deployer, receiver, addr1;

    let singerAddress = `${process.env.PRVATE_ADDRESS}`; 
    let singerPrivateKey = `0x${process.env.PRIVATE_BSC_TEST}`; 
    

    before(async function () {
        [deployer, receiver, addr1] = await ethers.getSigners();
        const deployment = require("../scripts/deploy.exe");

        deployments = await deployment.execute(deployer, receiver);
    });

    describe("mintForUse",async function () {
        it("should mint parts successfully",async function(){
            for (var i = 0; i < 5; i++) {
                await deployments.part.claim(i,20000);  
            }
            await deployments.part.safeBatchTransferFrom(deployer.address,receiver.address,[0,1,2,3,4],[10000,10000,10000,10000,10000],"0x");
            await deployments.part.connect(receiver).setApprovalForAll(deployments.weaponHelper.address, true);
        });

        it("should mint Ship successfully", async function () {
            await deployments.hull.miningSwitch(true);

            await deployments.trias.transfer(receiver.address, "10000000000000000000");
            await deployments.trias.connect(receiver).approve(deployments.hull.address,"10000000000000000000");

            for (var i = 0; i < 5; i++) {
                await deployments.hull.connect(receiver).claim("AAA", "happy", 1);
            } 

            await deployments.hull.connect(receiver).setApprovalForAll(deployments.weaponHelper.address,true);
            
            for (var i = 0; i < 5; i++) {
                await deployments.ship.connect(receiver).create(33, i);
            } 

            expect(await deployments.ship.balanceOf(receiver.address)).to.equal(5);

        });
    });

    describe("DetectNFT",async function () {
        it("should detect successfully",async function(){
             //set approve
            await deployments.ship.connect(receiver).setApprovalForAll(deployments.bscDetectV2.address,true);

            await deployments.bscDetectV2.connect(receiver).detectNFT(deployments.ship.address,[0,1,2,3,4],true);

            expect(await deployments.ship.balanceOf(deployments.bscDetectV2.address)).to.equal(5);
        })
       
    })

    describe("claimNFT",async function () {

        it("should change verifyAddress succsfully",async function(){
            await deployments.bscDetectV2.changeVerifyAddress(singerAddress);
            //expect(await deployments.ship.balanceOf(deployments.bscDetectV2.address)).to.equal(10);
        })

        it("should claim NFT successfully",async function(){
            // console.log("packed:",await deployments.bscDetectV2.getPacked(receiver.address,[0,1,2,3]));
            // const getHash = await deployments.bscDetectV2.getHash(receiver.address,[0,1,2,3]);
            // console.log("hash:",getHash);
            // console.log("EthSignedMessageHash:",await deployments.bscDetectV2.getEthSignedMessageHash(getHash));

            const userNonce = await deployments.bscDetectV2.userNonce(receiver.address);
            const claimInfoHash = web3.utils.soliditySha3({t: 'address', v: deployments.ship.address},{t: 'address', v: receiver.address},{t: 'uint256[]', v: [0,1,2,3]},{t: 'uint256', v: userNonce});

            const sigObj = await web3.eth.accounts.sign(claimInfoHash,singerPrivateKey)
            const msgHash = sigObj.messageHash;
            const v = sigObj.v;
            const r = sigObj.r;
            const s = sigObj.s;

            await deployments.bscDetectV2.connect(receiver).claimNFT(deployments.ship.address,receiver.address,[0,1,2,3],userNonce,msgHash,v,r,s)
            expect(await deployments.ship.balanceOf(deployments.bscDetectV2.address)).to.equal(1);

            expect(await deployments.bscDetectV2.userNonce(receiver.address)).to.equal(1);
        });
    })

    describe("claimToken",async function () {
        it("should claim Token successfully",async function(){

            await deployments.geon.approve(deployments.bscDetectV2.address, "10000000000000000000000000");

            const userNonce = await deployments.bscDetectV2.userNonce(receiver.address);
            const claimInfoHash = web3.utils.soliditySha3({t: 'address', v: receiver.address},{t: 'uint256', v: 10000},{t: 'uint256', v: userNonce});

            const sigObj = await web3.eth.accounts.sign(claimInfoHash,singerPrivateKey)
            const msgHash = sigObj.messageHash;
            const v = sigObj.v;
            const r = sigObj.r;
            const s = sigObj.s;

            await deployments.bscDetectV2.connect(receiver).claimToken(receiver.address,10000,userNonce,msgHash,v,r,s)
            expect(await deployments.geon.balanceOf(receiver.address)).to.equal("10000000000000000000000");

            expect(await deployments.bscDetectV2.userNonce(receiver.address)).to.equal(2);

            // console.log(receiver.address);
            // console.log(receiver.privatekey);
        })

        it("should sign with privateKey",async function(){
            const userAddress = "0x877D9D69bb4cAA7C7a302Cdc03A646917eA3e4Af";
            const contractAddress = "0xE5913A0358d1600fBF3D73DF2F1e2d791228A8b1";
            const privatkey = "fd23500ff03f2c1aeab7d6f2cb89b88749a97e4df5d6f7801816f6bfb6d5b2a6";

            //const claimInfoHash = web3.utils.soliditySha3({t: 'address', v: contractAddress},{t: 'address', v: userAddress},{t: 'uint256[]', v: [9111]},{t: 'uint256', v: 1});
            const claimInfoHash = web3.utils.soliditySha3({t: 'address', v: contractAddress},{t: 'address', v: userAddress},{t: 'uint256[]', v: [18479]},{t: 'uint256', v: 0});

            const sigObj = await web3.eth.accounts.sign(claimInfoHash,singerPrivateKey)
            const msgHash = sigObj.messageHash;
            const v = sigObj.v;
            const r = sigObj.r;
            const s = sigObj.s;
            console.log("msgHash:",msgHash);
            console.log("v:",v);
            console.log("r:",r);
            console.log("s:",s);
        })

        //0x02ccfe67326216fdaff7c9d4ccdfc41293419547e7bb00107e80cac322dc210a
        //0x9824aee5b6bdec718ddd1a0f518c8164d5ecacb141799c709994e0dd99e5c87f

        
    })
});