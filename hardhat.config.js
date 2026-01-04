import "dotenv/config";

/**
 * Hardhat ESM config with Sepolia network (uses .env)
 */
export default {
	solidity: "0.8.19",
	networks: process.env.SEPOLIA_RPC_URL
		? {
				sepolia: {
					type: "http",
					chainId: 11155111,
					url: process.env.SEPOLIA_RPC_URL,
					accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
				},
			}
		: {},
};
