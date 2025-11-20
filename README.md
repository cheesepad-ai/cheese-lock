# CheeseLock

CheeseLock is a smart contract system for secure token locking and vesting mechanisms in the CheesePad ecosystem.

## Deployed addresses

#### BNB Smart Chain

```
0x1E7826b7E3244aDB5e137A5F1CE49095f6857140
```

[View on Explorer](https://bscscan.com/address/0x1E7826b7E3244aDB5e137A5F1CE49095f6857140)

#### BNB Smart Chain Testnet

```
0x1E7826b7E3244aDB5e137A5F1CE49095f6857140
```

[View on Explorer](http://testnet.bscscan.com/address/0x1E7826b7E3244aDB5e137A5F1CE49095f6857140)

## Usage

### Reading Lock Data by ID

#### Using ethers.js

```typescript
import { ethers } from "ethers";
import CheeseLockABI from "./abi/CheeseLock.json";

const provider = new ethers.JsonRpcProvider(
  "https://bsc-dataseed1.binance.org/"
);
// CheeseLock contract address on BNB
const contractAddress = "0x1E7826b7E3244aDB5e137A5F1CE49095f6857140";
const contract = new ethers.Contract(contractAddress, CheeseLockABI, provider);

async function getLockData(lockId: number) {
  try {
    const lockData = await contract.getLockById(lockId);
    console.log("Lock Data:", {
      id: lockData.id.toString(), // Unique lock identifier
      token: lockData.token, // Token contract address
      owner: lockData.owner, // Lock owner address
      amount: lockData.amount.toString(), // Total locked amount
      lockDate: new Date(Number(lockData.lockDate) * 1000).toISOString(), // Lock creation timestamp
      tgeDate: new Date(Number(lockData.tgeDate) * 1000).toISOString(), // Token generation event date
      tgeBps: lockData.tgeBps.toString(), // TGE unlock percentage in basis points
      cycle: lockData.cycle.toString(), // Vesting cycle duration in seconds
      cycleBps: lockData.cycleBps.toString(), // Cycle unlock percentage in basis points
      unlockedAmount: lockData.unlockedAmount.toString(), // Amount already unlocked
      description: lockData.description, // Lock description
    });
    return lockData;
  } catch (error) {
    console.error("Error fetching lock data:", error);
  }
}

// Example usage
getLockData(1);
```

#### Using viem

```typescript
import { createPublicClient, http, getContract } from "viem";
import { bsc } from "viem/chains";
import CheeseLockABI from "./abi/CheeseLock.json";

const publicClient = createPublicClient({
  chain: bsc,
  transport: http(),
});

const contractAddress = "0x1E7826b7E3244aDB5e137A5F1CE49095f6857140" as const;

const contract = getContract({
  address: contractAddress,
  abi: CheeseLockABI,
  publicClient,
});

async function getLockData(lockId: bigint) {
  try {
    const lockData = await contract.read.getLockById([lockId]);
    console.log("Lock Data:", {
      id: lockData.id.toString(), // Unique lock identifier
      token: lockData.token, // Token contract address
      owner: lockData.owner, // Lock owner address
      amount: lockData.amount.toString(), // Total locked amount
      lockDate: new Date(Number(lockData.lockDate) * 1000).toISOString(), // Lock creation timestamp
      tgeDate: new Date(Number(lockData.tgeDate) * 1000).toISOString(), // Token generation event date
      tgeBps: lockData.tgeBps.toString(), // TGE unlock percentage in basis points
      cycle: lockData.cycle.toString(), // Vesting cycle duration in seconds
      cycleBps: lockData.cycleBps.toString(), // Cycle unlock percentage in basis points
      unlockedAmount: lockData.unlockedAmount.toString(), // Amount already unlocked
      description: lockData.description, // Lock description
    });
    return lockData;
  } catch (error) {
    console.error("Error fetching lock data:", error);
  }
}

// Example usage
getLockData(1n);
```
