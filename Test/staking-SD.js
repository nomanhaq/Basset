import contracts from './contracts'
import { FarmConfig, QuoteToken } from './types'

const farms: FarmConfig[] = [

    {
    pid: 0,
    risk: 5,
    lpSymbol: 'BNB-SD LP',
    lpAddresses: {
      97: '',
      56: '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c',
    },
    tokenSymbol: 'SD', 
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45', 
    },
    quoteTokenSymbol: QuoteToken.BUSD,
    quoteTokenAdresses: contracts.busd,
  },
  {
    pid: 1,
    risk: 5,
    lpSymbol: 'BTCB-SD LP',
    lpAddresses: {
      97: '',
      56: '0x7130d2a12b9bcbfae4f2634d864a1ee1ce3ead9c',
    },
    tokenSymbol: 'SD', 
    tokenAddresses: {
      97: '',      
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45', 
    },
    quoteTokenSymbol: QuoteToken.BNB,
    quoteTokenAdresses: contracts.wbnb,
  },

  {
    pid: 2,
    risk: 3,
    lpSymbol: 'DOG-SD LP',
    lpAddresses: {
      97: '',
      56: '0xba2ae424d960c26247dd6c32edc70b295c744c43',
    },
    tokenSymbol: 'SD',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BUSD,
    quoteTokenAdresses: contracts.busd,
  },
   {
    pid: 3,
    risk: 1,
    lpSymbol: 'USDT-SD LP',
    lpAddresses: {
      97: '',
      56: '0x55d398326f99059ff775485246999027b3197955',
    },
    tokenSymbol: 'USDT',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BUSD,
    quoteTokenAdresses: contracts.busd,
  },
   {
    pid: 4,
    risk: 2,
    lpSymbol: 'CHAINLINK-SD LP',
    lpAddresses: {
      97: '',
      56: '0xf8a0bf9cf54bb92f17374d9e9a321e6a111a51bd',
    },
    tokenSymbol: 'BTCB',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BNB,
    quoteTokenAdresses: contracts.wbnb,
  },
  {
    pid: 5,
    risk: 2,
    lpSymbol: 'SAFEMOON-SD LP',
    lpAddresses: {
      97: '',
      56: '0x8076c74c5e3f5852037f31ff0093eeb8c8add8d3',
    },
    tokenSymbol: 'SD',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BNB,
    quoteTokenAdresses: contracts.wbnb,
  },
 
  {
    pid: 6,
    risk: 1,
    lpSymbol: 'CBR-SD LP',
    lpAddresses: {
      97: '',
      56: '0xbc53ea3b031e61229ee73fafb2f9d4862f842eff',
    },
    tokenSymbol: 'SD',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BUSD,
    quoteTokenAdresses: contracts.busd,
  },
  {
    pid: 7,
    risk: 1,
    lpSymbol: 'ADA-SD LP',
    lpAddresses: {
      97: '',
      56: '0x9a0af7fdb2065ce470d72664de73cae409da28ec',
    },
    tokenSymbol: 'SD',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BUSD,
    quoteTokenAdresses: contracts.busd,
  },
  {
    pid: 8,
    risk: 3,
    lpSymbol: 'SHIBA INU-SD LP',
    lpAddresses: {
      97: '',
      56: '0x2859e4544c4bb03966803b044a93563bd2d0dd4d',
    },
    tokenSymbol: 'SD',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BNB,
    quoteTokenAdresses: contracts.wbnb,
  },
  {
    pid: 9,
    risk: 4,
    lpSymbol: 'LTC-SD LP',
    lpAddresses: {
      97: '',
      56: '0x57a5297f2cb2c0aac9d554660acd6d385ab50c6b',
    },
    tokenSymbol: 'SD',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BUSD,
    quoteTokenAdresses: contracts.busd,
  },
  {
    pid: 10,
    risk: 4,
    lpSymbol: 'CAKE-SD LP',
    lpAddresses: {
      97: '',
      56: '0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82',
    },
    tokenSymbol: 'CAKE',
    tokenAddresses: {
      97: '',
      56: '0x277819bf69667b48af57abc52dddcb92ab6a2c45',
    },
    quoteTokenSymbol: QuoteToken.BNB,
    quoteTokenAdresses: contracts.wbnb,
  },
]

export default farms