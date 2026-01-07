# Decentralized AI-Powered Sports Betting Clearinghouse

A full-stack **Web3 + AI platform** that models sports betting as a **financial clearing and portfolio management system**. The project combines **blockchain smart contracts** for trustless settlement with **machine-learning–based predictive analytics** to evaluate betting decisions as probabilistic investments.

Think **Robinhood-style portfolio tracking**, but for sports betting — powered by **AI decision intelligence** and **blockchain-backed execution**.

---

## Project Overview

Traditional sports betting platforms are opaque, fragmented, and centralized. This project re-imagines sports betting infrastructure as a **decentralized clearinghouse**, where:

- Bets are locked, settled, and audited on-chain  
- Outcomes are resolved via oracle-style administration  
- Wagers are tracked as portfolio assets with exposure and PnL  
- AI models provide probabilistic forecasts and edge analysis  

The result is a transparent, trustless, and data-driven betting system inspired by **quantitative finance and market infrastructure**.

---

## System Architecture

AI Prediction Engine
↓
Frontend Portfolio Dashboard (React + MetaMask)
↓
Smart Contract Clearinghouse (Solidity)
↓
Ethereum Testnet (Settlement & Payouts)

markdown
Copy code

---

## Blockchain Layer (Clearinghouse)

### Smart Contract: `BettingClearinghouse.sol`

**Responsibilities**
- Accept and lock ETH wagers  
- Store bets immutably on-chain  
- Resolve outcomes via oracle/admin  
- Automatically pay winners  
- Support emergency refunds  

**Key Concepts**
- Wagers = collateralized positions  
- Settlement = trustless execution  
- Contract = financial clearinghouse analogue  

Contracts are developed and deployed using **Hardhat and Ethers.js** on Ethereum testnet.

---

## AI Prediction Engine

The AI layer provides **decision support**, not automation.

**Models**
- Logistic Regression  
- Poisson Models  
- (Optional) XGBoost  

**Outputs**
- Win probabilities  
- Expected value (EV)  
- Model odds vs market odds  
- Suggested betting edge  

This mirrors how **quantitative trading systems** evaluate risk and return.

---

## Frontend (Portfolio Dashboard)

Built with **React and MetaMask integration**, the frontend allows users to:

- Connect a Web3 wallet  
- Place on-chain bets  
- View active and settled positions  
- Track bets like financial assets  
- Compare AI predictions to market odds  

The UI is intentionally designed as a **portfolio dashboard**, not a traditional sportsbook.

---

## Tech Stack

**Blockchain**
- Solidity  
- Hardhat  
- Ethers.js  
- Ethereum (Sepolia testnet)  

**Frontend**
- React  
- MetaMask  
- JavaScript  

**AI / Data**
- Python  
- Pandas  
- NumPy  
- Scikit-learn  

**Tooling**
- GitHub  
- VS Code  
- Alchemy RPC  
- dotenv  

---

## Local Development

### Install dependencies
```bash
npm install
Compile contracts
bash
Copy code
npx hardhat compile
Start frontend
bash
Copy code
cd frontend
npm start
Deployment (Testnet)
Create .env from .env.example

Add Sepolia RPC URL and MetaMask private key

Fund wallet with testnet ETH

Deploy contract:

bash
Copy code
npx hardhat run scripts/deploy.js --network sepolia
Roadmap
 Smart contract clearinghouse

 Hardhat deployment pipeline

 Frontend wallet connection

 Frontend ↔ contract integration

 AI model → frontend predictions

 Portfolio analytics (PnL, win rate)

 Oracle automation (Chainlink)

Why This Project Matters
This project demonstrates:

Blockchain systems design

AI-driven probabilistic modeling

Financial market analogies

End-to-end full-stack engineering

It is not a sportsbook — it is Web3 financial infrastructure applied to sports markets.

License
MIT License

yaml
Copy code

