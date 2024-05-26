//샘플코드
const hre = require("hardhat");
async function main() {
  const LOCK = await hre.ethers.getContractFactory("DeliveryOrder"/*contract명*/);
  const lock = await LOCK.deploy();
  console.log("LOCK Info : ", lock);
  console.log("LOCK deployed to : ", lock.target);
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});