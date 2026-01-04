// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title BettingClearinghouse
 * @dev Blockchain-based settlement layer for sports bets
 */
contract BettingClearinghouse {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can resolve bets");
        _;
    }

    enum BetStatus {
        OPEN,
        WON,
        LOST,
        REFUNDED
    }

    struct Bet {
        uint256 betId;
        address bettor;
        string matchId;
        string selection;
        uint256 amount;
        BetStatus status;
    }

    uint256 public nextBetId;
    mapping(uint256 => Bet) public bets;
    mapping(string => uint256[]) public betsByMatch;

    /// @notice Place a bet (ETH locked in contract)
    function placeBet(
        string calldata matchId,
        string calldata selection
    ) external payable {
        require(msg.value > 0, "Bet amount must be > 0");

        bets[nextBetId] = Bet({
            betId: nextBetId,
            bettor: msg.sender,
            matchId: matchId,
            selection: selection,
            amount: msg.value,
            status: BetStatus.OPEN
        });

        betsByMatch[matchId].push(nextBetId);
        nextBetId++;
    }

    /// @notice Resolve all bets for a match (oracle/admin call)
    function resolveMatch(
        string calldata matchId,
        string calldata winningSelection
    ) external onlyOwner {
        uint256[] memory matchBets = betsByMatch[matchId];

        for (uint256 i = 0; i < matchBets.length; i++) {
            Bet storage bet = bets[matchBets[i]];

            if (bet.status != BetStatus.OPEN) continue;

            if (
                keccak256(bytes(bet.selection)) ==
                keccak256(bytes(winningSelection))
            ) {
                bet.status = BetStatus.WON;
                payable(bet.bettor).transfer(bet.amount * 2);
            } else {
                bet.status = BetStatus.LOST;
            }
        }
    }

    /// @notice Emergency refund
    function refundBet(uint256 betId) external onlyOwner {
        Bet storage bet = bets[betId];
        require(bet.status == BetStatus.OPEN, "Bet not refundable");

        bet.status = BetStatus.REFUNDED;
        payable(bet.bettor).transfer(bet.amount);
    }
}
