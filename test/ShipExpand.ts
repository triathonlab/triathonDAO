import { expect } from "chai";
import { ethers } from "hardhat";

describe("shipExpand", function () {
    let deployments;
    let deployer, receiver, addr1;

    let singerAddress = "0x742E4dB18Af5AE0e4f7E66F3B27cd1D3A189DB49";
    let singerPrivateKey = "fd23500ff03f2c1aeab7d6f2cb89b88749a97e4df5d6f7801816f6bfb6d5b2a6";  
    

    before(async function () {
        [deployer, receiver, addr1] = await ethers.getSigners();
        const deployment = require("../scripts/deploy.exe");

        deployments = await deployment.execute(deployer, receiver);
    });

    // describe("mintForUse",async function () {
    //     it("should mint parts successfully",async function(){
    //         for (var i = 0; i < 5; i++) {
    //             await deployments.part.claim(i,20000);  
    //         }
    //         //await deployments.part.safeBatchTransferFrom(deployer.address,deployments.triathonBatchTool.address,[0,1,2,3,4],[10000,10000,10000,10000,10000],"0x");
    //     });

    //     it("should mint shipDelusionist successfully", async function () {
    //         // 30个
    //         await deployments.trias.transfer(deployments.triathonBatchTool.address, "400000000000000000000");
    //         //var beforeSupply = await deployments.ship.totalSupply();
    //         // for (var i = 0; i < 1; i++) {
    //         //     await deployments.triathonBatchTool.batchCreateWeapons(222,30);  
    //         // }
    //         await deployments.triathonBatchTool.batchCreateWeapons(222,30);  
    //     });

    //     it("should transfer to receiver successfully",async function(){
    //         await deployments.trias.transfer(receiver.address, "860000000000000000000");
    //         for(var i=0;i<10;i++){
    //             await deployments.ship.transferFrom(deployer.address,receiver.address, i);
    //         }
    //         expect(await deployments.ship.balanceOf(receiver.address)).to.equal(10);
    //     })


    // });

    describe("addBlood",async function () {
        it("should change verifyAddress succsfully",async function(){
            await deployments.shipExpand.changeVerifyAddress(singerAddress);
            //expect(await deployments.ship.balanceOf(deployments.bscDetectV2.address)).to.equal(10);
        })
        
        it("should add blood successfully",async function(){

            await deployments.geon.transfer(receiver.address, "400000000000000000000");

            //setApprove
            await deployments.geon.connect(receiver).approve(deployments.shipExpand.address,"10000000000000000000000");

            const contractAddress = "0xEda16508495Ad0f33b6B22E76A168c726E40EA17";

            const userNonce = await deployments.shipExpand.userNonce(receiver.address);
            const claimInfoHash = web3.utils.soliditySha3({t: 'address', v: contractAddress},{t: 'uint256', v: 5},{t: 'uint256', v: 100},{t: 'uint256', v: 100},{t: 'uint256', v: userNonce});

            const sigObj = await web3.eth.accounts.sign(claimInfoHash,singerPrivateKey)
            const msgHash = sigObj.messageHash;
            const v = sigObj.v;
            const r = sigObj.r;
            const s = sigObj.s;

            await deployments.shipExpand.connect(receiver).addBlood(contractAddress,5,100,100,userNonce,msgHash,v,r,s)

            expect(await deployments.shipExpand.userNonce(receiver.address)).to.equal(1);
        })

        it("should get test data successfully",async function(){

            const userNonce = 0;
            const contractAddress = "0xEda16508495Ad0f33b6B22E76A168c726E40EA17";
            const claimInfoHash = web3.utils.soliditySha3({t: 'address', v: contractAddress},{t: 'uint256', v: 9092},{t: 'uint256', v: 5},{t: 'uint256', v: 5},{t: 'uint256', v: 0});

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
    })

    describe("upgrade",async function () {
        it("should upgrade successfully",async function(){
            const contractAddress = "0xEda16508495Ad0f33b6B22E76A168c726E40EA17";
            const userNonce = await deployments.shipExpand.userNonce(receiver.address);
            const claimInfoHash = web3.utils.soliditySha3({t: 'address', v: contractAddress},{t: 'uint256', v: 5},{t: 'uint256', v: 100},{t: 'uint256', v: 100},{t: 'uint256', v: userNonce});

            const sigObj = await web3.eth.accounts.sign(claimInfoHash,singerPrivateKey)
            const msgHash = sigObj.messageHash;
            const v = sigObj.v;
            const r = sigObj.r;
            const s = sigObj.s;
            await deployments.shipExpand.connect(receiver).upgrade(contractAddress,5,100,100,userNonce,msgHash,v,r,s)
            expect(await deployments.shipExpand.userNonce(receiver.address)).to.equal(2);
        })
    })


});