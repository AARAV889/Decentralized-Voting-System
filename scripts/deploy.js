async function main() {
  const VotingSystem = await ethers.getContractFactory("DecentralizedVotingSystem");
  const voting = await VotingSystem.deploy();

  await voting.deployed();
  console.log("Contract deployed to:", voting.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
