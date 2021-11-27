import contracts from './contracts'
import { FarmConfig, QuoteToken } from './types'

const farms: FarmConfig[] = [
  {
    pid: 0,
    risk: 5,
    lpSymbol: 'SD-BNB LP',
    lpAddresses: {
      97: '',
      56: '0x081Fa7129Dde4D822BB64bEfEd0d06d9458f77F2',
    },
    tokenSymbol: 'SD',
    tokenAddresses: {
      97: '',
      56: '0xfA01802C8Bf25A31F945F6C63F7c35b575C5e828',
    },
    quoteTokenSymbol: QuoteToken.BUSD,
    quoteTokenAdresses: contracts.busd,
  },
  {
    pid: 1,
    risk: 5,
    lpSymbol: 'SD-BTCB LP',
    lpAddresses: {
      97: '',
      56: '0xFb776B5075A7138E1e3C128bC5A8d29d196a5369',
    },
    tokenSymbol: 'SD',
    tokenAddresses: {
      97: '',
      56: '0xfA01802C8Bf25A31F945F6C63F7c35b575C5e828',
    },
    quoteTokenSymbol: QuoteToken.BNB,
    quoteTokenAdresses: contracts.wbnb,
  },
]

export default farms