/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 14:57:21
 * @LastEditTime: 2022-11-09 20:31:59
 * @LastEditors: zyq
 * @Reference: 
 */
import { ethers } from "hardhat";

async function deploy(deployer, receiver = undefined) {
    if (receiver == undefined) {
        receiver = deployer;
    }

    // Trias
    const Trias = await ethers.getContractFactory("TriasOnBSC");
    const trias = await Trias.deploy('trias', 'TRIAS', 1000000000);
    await trias.deployed();

    // Geon
    const Geon = await ethers.getContractFactory("Geon");
    const geon = await Geon.deploy('geon', 'GEON', 1000000000);
    await geon.deployed();

    // Part
    const Part = await ethers.getContractFactory("ToolsLoot");
    const part = await Part.deploy();
    await part.deployed();

    // library BaseProperties
    const BaseProperties = await ethers.getContractFactory("BaseProperties");
    const baseProperties = await BaseProperties.deploy();
    await baseProperties.deployed();

    // Hull
    const Hull = await ethers.getContractFactory(
        "contracts/Hull.sol:TriathonLoot",
        {
            libraries: {
                BaseProperties: baseProperties.address,
            },
        });
    const hull = await Hull.deploy(trias.address, receiver.address);
    await hull.deployed();

    // NoFreeMint
    const NoFreeMint = await ethers.getContractFactory("NoFreeMint");
    const noFreeMint = await NoFreeMint.deploy(trias.address,hull.address);
    await noFreeMint.deployed();


   

    return {
        trias,
        geon,
        part,
        hull,
        noFreeMint
    };
}

let openPrint = false;

function print(anything) {
    if (openPrint) {
        console.log(anything);
    }
}

exports.execute = async function execute(deployer, receiver = undefined) {
    return await deploy(deployer, receiver);
}