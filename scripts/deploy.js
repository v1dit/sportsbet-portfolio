async function main() {
  const Clearinghouse = await ethers.getContractFactory("BettingClearinghouse");
  const clearinghouse = await Clearinghouse.deploy();

  await clearinghouse.deployed();

  console.log("BettingClearinghouse deployed to:", clearinghouse.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
