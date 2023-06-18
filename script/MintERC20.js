parsed = require("dotenv").config();
const { ethers } = require("ethers");

provider = ethers.getDefaultProvider(process.env.LOCAL_URL);


await provider.send("anvil_setBalance", [
  process.env.ALICE,
  Number(1000).toString(),
]);

// await provider.getBalance(process.env.ALICE);



// update balance
stdstore.target(token).sig(0x70a08231).with_key(to).checked_write(give);