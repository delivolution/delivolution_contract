const fs = require('fs');
const hre = require("hardhat");

async function main() {
  const LOCK = await hre.ethers.getContractFactory("DeliveryOrder"/*contract명*/);
  const lock = await LOCK.deploy();
  const abi = LOCK.interface.format(LOCK.interface);
  
  console.log("LOCK Info : ", lock);
  console.log("LOCK deployed to : ", lock.target);
  console.log("LOCK ABI : ", abi); // ABI 출력
  
  // ABI를 JSON 파일로 저장
  fs.writeFileSync('./ContractABI.json', JSON.stringify(abi, null, 2));
  console.log('ABI saved to ContractABI.json');
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
