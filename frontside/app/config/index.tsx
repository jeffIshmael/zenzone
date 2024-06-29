
// config/index.tsx

import { defaultWagmiConfig } from '@web3modal/wagmi/react/config'

import { cookieStorage, createStorage, http } from 'wagmi'
import { mainnet, sepolia , liskSepolia, celoAlfajores} from 'wagmi/chains'

// Your WalletConnect Cloud project ID
export const projectId = '0a98c1578d27b785abf7d78274291a4e'

// Create a metadata object
const metadata = {
  name: 'zenzone',
  description: 'Leveraging carbon credits',
  url: 'https://web3modal.com', // origin must match your domain & subdomain
  icons: ['https://avatars.githubusercontent.com/u/37784886']
}



// Create wagmiConfig
const chains = [mainnet, sepolia, liskSepolia, celoAlfajores] as const
export const wagmiConfig = defaultWagmiConfig({
    chains, // required
    projectId, // required
    metadata, // required
    ssr: true,
    transports: {
      [mainnet.id]: http(),
      [sepolia.id]: http(),
      [liskSepolia.id]: http(),
      [celoAlfajores.id]: http()
      // [bscTestnet.id]: http('https://data-seed-prebsc-1-s1.binance.org:8545'),
    },
    storage: createStorage({
      storage: cookieStorage,
    }),
    enableWalletConnect: true, // Optional - true by default
    enableInjected: true, // Optional - true by default
    enableEIP6963: true, // Optional - true by default
    enableCoinbase: true, // Optional - true by default
  });