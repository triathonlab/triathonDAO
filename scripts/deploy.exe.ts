/*
 * @Description: 
 * @Author: zyq
 * @Date: 2022-11-09 14:57:21
 * @LastEditTime: 2022-11-09 15:15:24
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

   

    return {
        trias,
        geon,
        part
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