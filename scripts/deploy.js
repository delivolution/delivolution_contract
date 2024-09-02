const fs = require('fs');
const hre = require("hardhat");

async function main() {
  const DeliveryOrder = await hre.ethers.getContractFactory("DeliveryOrder"/*contract명*/);
  const Deliveryorder = await DeliveryOrder.deploy();
  const abi = DeliveryOrder.interface.format(DeliveryOrder.interface);
  
  console.log("DeliveryOrder Info : ", Deliveryorder);
  console.log("DeliveryOrder deployed to : ", Deliveryorder.target);
  console.log("DeliveryOrder ABI : ", abi); // ABI 출력
  
  // ABI를 JSON 파일로 저장
  fs.writeFileSync('./ContractABI.json', JSON.stringify(abi, null, 2));
  console.log('ABI saved to ContractABI.json');
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
