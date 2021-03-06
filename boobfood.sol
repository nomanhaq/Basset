/**
 *Submitted for verification at BscScan.com on 2021-05-21
*/

// SPDX-License-Identifier: MIT

/*
2% of every transaction gets redistributed back to those accounts that are holding the currency.
2% of every transaction gets added to liquidity pool.
3% of every transaction will go into the Charity Wallet AND Marketing/Operations Wallet, 
No rug-pulls: Maximum buy/sell order cannot exceed 0.5% of the total supply of currency.

www.boobfood.charity

*/

pragma solidity ^0.8.4;

abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

/**
 * @dev Interface of the BEP20 standard as defined in the EIP.
 */
interface IBEP20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash =
            0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            codehash := extcodehash(account)
        }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return
            functionCallWithValue(
                target,
                data,
                value,
                "Address: low-level call with value failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(
            address(this).balance >= value,
            "Address: insufficient balance for call"
        );
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(
        address target,
        bytes memory data,
        uint256 weiValue,
        string memory errorMessage
    ) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) =
            target.call{value: weiValue}(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address public _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

contract BOOBFOOD is Context, IBEP20, Ownable {
    using SafeMath for uint256;
    using Address for address;

    mapping(address => uint256) private _rOwned;
    mapping(address => uint256) private _tOwned;
    mapping(address => mapping(address => uint256)) private _allowances;

    mapping(address => bool) private _isExcluded;
    mapping(address => bool) private _isCharity;
    mapping(address => bool) private _isOperationsAndMarketing;
    mapping(address => bool) private _isOwner;
    address[] private _excluded;

    string private _NAME;
    string private _SYMBOL;
    uint256 private _DECIMALS;
    address public FeeAddress;

    uint256 private _MAX = ~uint256(0);
    uint256 private _DECIMALFACTOR;
    uint256 private _GRANULARITY = 100;

    uint256 private _tTotal;
    uint256 private _rTotal;
    uint256 public mintedTokens;

    uint256 private _tFeeTotal;
    uint256 private _tBurnTotal;
    uint256 private _tCharityTotal;

    uint256 private _TAX_FEE;
    uint256 private _BURN_FEE;
    uint256 private _CHARITY_AND_OPERATIONS_FEE;

    uint256 public _maxTxAmount;
    uint256 public _maxTxAmountDivideTotalPer;

    // Track original fees to bypass fees for charity account
    uint256 private ORIG_TAX_FEE;
    uint256 private ORIG_BURN_FEE;
    uint256 private ORIG_CHARITY_AND_OPERATIONS_FEE;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _decimals,
        uint256 _supply,
        uint256 _txFee,
        uint256 _burnFee,
        uint256 _charityFee,
        address _FeeAddress,
        address tokenOwner,
        uint256 paramMaxTxAmountDivideTotalPer
    ) {
        _NAME = _name;
        _SYMBOL = _symbol;
        _DECIMALS = _decimals;
        _DECIMALFACTOR = 10**uint256(_DECIMALS);
        _tTotal = _supply * _DECIMALFACTOR;
        mintedTokens = _supply;
        _rTotal = (_MAX - (_MAX % _tTotal));
        _TAX_FEE = _txFee * 50;
        _BURN_FEE = _burnFee * 50;
        _CHARITY_AND_OPERATIONS_FEE = _charityFee * 50;
        ORIG_TAX_FEE = _TAX_FEE;
        ORIG_BURN_FEE = _BURN_FEE;
        ORIG_CHARITY_AND_OPERATIONS_FEE = _CHARITY_AND_OPERATIONS_FEE;
        FeeAddress = _FeeAddress;
        _owner = tokenOwner;
        _maxTxAmountDivideTotalPer = paramMaxTxAmountDivideTotalPer;
        _maxTxAmount = _tTotal / _maxTxAmountDivideTotalPer;
        uint256 currentRate = _getRate();

        /*INITIALIZE ACCUMULATORS*/
        _tFeeTotal = 0;
        _tBurnTotal = 0;
        _tCharityTotal = 0;

        /*GET TOKEN SUPPLY TO OWNER WALLET = 100%*/
        _rOwned[tokenOwner] = _rTotal;
        _tOwned[tokenOwner] = _tTotal;
        _isExcluded[tokenOwner] = true;
        _excluded.push(tokenOwner);
        emit Transfer(address(0), tokenOwner, _tTotal);

        /*INITIAL CHARITY WALLET 4%*/
        _isCharity[_FeeAddress] = true;
        _isExcluded[_FeeAddress] = true;
        _excluded.push(_FeeAddress);
        _rOwned[_FeeAddress] = (_tTotal / 100) * currentRate * 4;
        _tOwned[_FeeAddress] = (_tTotal / 100) * 4;
        emit Transfer(tokenOwner, _FeeAddress, (_tTotal / 100) * 4);

        /*INITIAL OPERATIONS WALLET  1%*/
        _isOperationsAndMarketing[
            0xe3da8b11C6e48344Af109537F1f6aDa6576e2363
        ] = true;
        _isExcluded[0xe3da8b11C6e48344Af109537F1f6aDa6576e2363] = true;
        _excluded.push(0xe3da8b11C6e48344Af109537F1f6aDa6576e2363);
        _rOwned[0xe3da8b11C6e48344Af109537F1f6aDa6576e2363] =
            (_tTotal / 100) *
            currentRate;
        _tOwned[0xe3da8b11C6e48344Af109537F1f6aDa6576e2363] = (_tTotal / 100);
        emit Transfer(
            tokenOwner,
            0xe3da8b11C6e48344Af109537F1f6aDa6576e2363,
            (_tTotal / 100)
        );

        /*DEV1 WALLET AMOUNT 0.5%*/
        _isExcluded[0xB516442Cf1F32Ba701586b9b39d307D020Ab824C] = true;
        _excluded.push(0xB516442Cf1F32Ba701586b9b39d307D020Ab824C);
        _rOwned[0xB516442Cf1F32Ba701586b9b39d307D020Ab824C] =
            (_tTotal / 200) *
            currentRate;
        _tOwned[0xB516442Cf1F32Ba701586b9b39d307D020Ab824C] = (_tTotal / 200);
        emit Transfer(
            tokenOwner,
            0xB516442Cf1F32Ba701586b9b39d307D020Ab824C,
            (_tTotal / 200)
        );

        /*DEV2 WALLET AMOUNT  0.5%*/
        _isExcluded[0xB83b167245E04A5D6168F6b2e55e33e3CA09CC20] = true;
        _excluded.push(0xB83b167245E04A5D6168F6b2e55e33e3CA09CC20);
        _rOwned[0xB83b167245E04A5D6168F6b2e55e33e3CA09CC20] =
            (_tTotal / 200) *
            currentRate;
        _tOwned[0xB83b167245E04A5D6168F6b2e55e33e3CA09CC20] = (_tTotal / 200);
        emit Transfer(
            tokenOwner,
            0xB83b167245E04A5D6168F6b2e55e33e3CA09CC20,
            (_tTotal / 200)
        );

        /*DEV3 WALLET AMOUNT  0.5%*/
        _isExcluded[0x6712E35135Eb210271b8133c6fE0bcD10C2B1524] = true;
        _excluded.push(0x6712E35135Eb210271b8133c6fE0bcD10C2B1524);
        _rOwned[0x6712E35135Eb210271b8133c6fE0bcD10C2B1524] =
            (_tTotal / 200) *
            currentRate;
        _tOwned[0x6712E35135Eb210271b8133c6fE0bcD10C2B1524] = (_tTotal / 200);
        emit Transfer(
            tokenOwner,
            0x6712E35135Eb210271b8133c6fE0bcD10C2B1524,
            (_tTotal / 200)
        );

        /*DEV4 WALLET AMOUNT  0.5%*/
        _isExcluded[0xF7c162AC577576daAeEE201260356BAF9C91d9B3] = true;
        _excluded.push(0xF7c162AC577576daAeEE201260356BAF9C91d9B3);
        _rOwned[0xF7c162AC577576daAeEE201260356BAF9C91d9B3] =
            (_tTotal / 200) *
            currentRate;
        _tOwned[0xF7c162AC577576daAeEE201260356BAF9C91d9B3] = (_tTotal / 200);
        emit Transfer(
            tokenOwner,
            0xF7c162AC577576daAeEE201260356BAF9C91d9B3,
            (_tTotal / 200)
        );

        /*DEV5 WALLET AMOUNT  0.5%*/
        _isExcluded[0xC3D82dCf66Cc51866D17bdF1e280DEE652B6CDe1] = true;
        _excluded.push(0xC3D82dCf66Cc51866D17bdF1e280DEE652B6CDe1);
        _rOwned[0xC3D82dCf66Cc51866D17bdF1e280DEE652B6CDe1] =
            (_tTotal / 200) *
            currentRate;
        _tOwned[0xC3D82dCf66Cc51866D17bdF1e280DEE652B6CDe1] = (_tTotal / 200);
        emit Transfer(
            tokenOwner,
            0xC3D82dCf66Cc51866D17bdF1e280DEE652B6CDe1,
            (_tTotal / 200)
        );

        /*LIQUIDITY LOCK WALLET =  40%*/
        _isExcluded[0x0217A97B42239783b8f99523cBB7a8E513799485] = true;
        _excluded.push(0x0217A97B42239783b8f99523cBB7a8E513799485);
        _rOwned[0x0217A97B42239783b8f99523cBB7a8E513799485] =
            (_tTotal / 100) *
            40 *
            currentRate;
        _tOwned[0x0217A97B42239783b8f99523cBB7a8E513799485] =
            (_tTotal / 100) *
            40;
        emit Transfer(
            tokenOwner,
            0x0217A97B42239783b8f99523cBB7a8E513799485,
            (_tTotal / 100) * 40
        );

        /*PUBLIC PRESALE 1 WALLET  = 5%*/
        _isExcluded[0x145FC1641E740d3AB20C4fb8D5bD981eaE1bADA8] = true;
        _excluded.push(0x145FC1641E740d3AB20C4fb8D5bD981eaE1bADA8);
        _rOwned[0x145FC1641E740d3AB20C4fb8D5bD981eaE1bADA8] =
            (_tTotal / 100) *
            5 *
            currentRate;
        _tOwned[0x145FC1641E740d3AB20C4fb8D5bD981eaE1bADA8] =
            (_tTotal / 100) *
            5;
        emit Transfer(
            tokenOwner,
            0x145FC1641E740d3AB20C4fb8D5bD981eaE1bADA8,
            (_tTotal / 100) * 5
        );

        /*PUBLIC PRESALE 2 WALLET  = 10%*/
        _isExcluded[0xaad3D7e06f2b24b9275821b861F9402CB83Beb29] = true;
        _excluded.push(0xaad3D7e06f2b24b9275821b861F9402CB83Beb29);
        _rOwned[0xaad3D7e06f2b24b9275821b861F9402CB83Beb29] =
            (_tTotal / 10) *
            currentRate;
        _tOwned[0xaad3D7e06f2b24b9275821b861F9402CB83Beb29] = (_tTotal / 10);
        emit Transfer(
            tokenOwner,
            0xaad3D7e06f2b24b9275821b861F9402CB83Beb29,
            (_tTotal / 10)
        );

        /*PUBLIC PRESALE 3 WALLET  = 12.5%*/
        _isExcluded[0x30190c9d55ABD95C7Bd394BA7BE98AE4d416F0e3] = true;
        _excluded.push(0x30190c9d55ABD95C7Bd394BA7BE98AE4d416F0e3);
        _rOwned[0x30190c9d55ABD95C7Bd394BA7BE98AE4d416F0e3] =
            (_tTotal / 200) *
            25 *
            currentRate;
        _tOwned[0x30190c9d55ABD95C7Bd394BA7BE98AE4d416F0e3] =
            (_tTotal / 200) *
            25;
        emit Transfer(
            tokenOwner,
            0x30190c9d55ABD95C7Bd394BA7BE98AE4d416F0e3,
            (_tTotal / 200) * 25
        );

        /*PUBLIC PRESALE 4 WALLET  = 15%*/
        _isExcluded[0x4e3187312c9867D19CDf9c5F1a86AC7CF3f81645] = true;
        _excluded.push(0x4e3187312c9867D19CDf9c5F1a86AC7CF3f81645);
        _rOwned[0x4e3187312c9867D19CDf9c5F1a86AC7CF3f81645] =
            (_tTotal / 100) *
            15 *
            currentRate;
        _tOwned[0x4e3187312c9867D19CDf9c5F1a86AC7CF3f81645] =
            (_tTotal / 100) *
            15;
        emit Transfer(
            tokenOwner,
            0x4e3187312c9867D19CDf9c5F1a86AC7CF3f81645,
            (_tTotal / 100) * 15
        );

        /*OWNER NOW HAS 10% of SUPPLY*/
        _rOwned[tokenOwner] = (_tTotal / 10) * currentRate;
        _tOwned[tokenOwner] = (_tTotal / 10);
    }

    function name() public view returns (string memory) {
        return _NAME;
    }

    function symbol() public view returns (string memory) {
        return _SYMBOL;
    }

    function decimals() public view returns (uint256) {
        return _DECIMALS;
    }

    function totalSupply() public view override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
        if (_isExcluded[account]) return _tOwned[account];
        return tokenFromReflection(_rOwned[account]);
    }

    function balanceOfT(address account) public view returns (uint256) {
        return _tOwned[account];
    }

    function balanceOfR(address account) public view returns (uint256) {
        return _rOwned[account];
    }

    function transfer(address recipient, uint256 amount)
        public
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender)
        public
        view
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()].sub(
                amount,
                "TOKEN20: transfer amount exceeds allowance"
            )
        );
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue)
        public
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].add(addedValue)
        );
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].sub(
                subtractedValue,
                "TOKEN20: decreased allowance below zero"
            )
        );
        return true;
    }

    function isExcluded(address account) public view returns (bool) {
        return _isExcluded[account];
    }

    function tokens(address account) public view returns (bool) {
        return _isExcluded[account];
    }

    function isCharity(address account) public view returns (bool) {
        return _isCharity[account];
    }

    function isOperationsAndMarketing(address account)
        public
        view
        returns (bool)
    {
        return _isOperationsAndMarketing[account];
    }

    function liquidityPerTxFee() public view returns (uint256) {
        return _TAX_FEE;
    }

    function totalLiquidityAwarded() public view returns (uint256) {
        return _tFeeTotal;
    }

    function getMaxTxAmountDivideTotalPer() public view returns (uint256) {
        return _maxTxAmountDivideTotalPer;
    }

    function burnPerTxFee() public view returns (uint256) {
        return _BURN_FEE;
    }

    function totalBurn() public view returns (uint256) {
        return _tBurnTotal;
    }

    function charityAndOperationsPerTxFee() public view returns (uint256) {
        return _CHARITY_AND_OPERATIONS_FEE;
    }

    function totalCharityAndOperations() public view returns (uint256) {
        return _tCharityTotal;
    }

    function deliver(uint256 tAmount) public {
        address sender = _msgSender();
        require(
            !_isExcluded[sender],
            "Excluded addresses cannot call this function"
        );
        (uint256 rAmount, , , , , , ) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(
            rAmount,
            "SafeMath: subtraction overflow. Call from: deliver"
        );
        _rTotal = _rTotal.sub(
            rAmount,
            "SafeMath: subtraction overflow. Call from: deliver2"
        );
        _tFeeTotal = _tFeeTotal.add(tAmount);
    }

    function reflectionFromToken(uint256 tAmount, bool deductTransferFee)
        public
        view
        returns (uint256)
    {
        require(tAmount <= _tTotal, "Amount must be less than supply");
        if (!deductTransferFee) {
            (uint256 rAmount, , , , , , ) = _getValues(tAmount);
            return rAmount;
        } else {
            (, uint256 rTransferAmount, , , , , ) = _getValues(tAmount);
            return rTransferAmount;
        }
    }

    function tokenFromReflection(uint256 rAmount)
        public
        view
        returns (uint256)
    {
        require(
            rAmount <= _rTotal,
            "Amount must be less than total reflections"
        );
        uint256 currentRate = _getRate();
        return
            rAmount.div(
                currentRate,
                "SafeMath: division by zero. Called from tokenFromReflection"
            );
    }

    function excludeAccount(address account) external onlyOwner() {
        require(!_isExcluded[account], "Account is already excluded");
        if (_rOwned[account] > 0) {
            _tOwned[account] = tokenFromReflection(_rOwned[account]);
        }
        _isExcluded[account] = true;
        _excluded.push(account);
    }

    function includeAccount(address account) external onlyOwner() {
        require(_isExcluded[account], "Account is already excluded");
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (_excluded[i] == account) {
                _excluded[i] = _excluded[_excluded.length - 1];
                _tOwned[account] = 0;
                _isExcluded[account] = false;
                _excluded.pop();
                break;
            }
        }
    }

    function setAsCharityAccount(address account) external onlyOwner() {
        require(!_isCharity[account], "Account is already charity account");
        _isCharity[account] = true;
        FeeAddress = account;
    }

    function burn(uint256 _value) public {
        _burn(msg.sender, _value);
    }

    function _burn(address _who, uint256 _value) internal {
        require(_value <= _rOwned[_who]);
        _rOwned[_who] = _rOwned[_who].sub(
            _value,
            "SafeMath: subtraction overflow. Call from: _burn"
        );
        _tTotal = _tTotal.sub(
            _value,
            "SafeMath: subtraction overflow. Call from: _burn2"
        );
        _maxTxAmount = _tTotal / _maxTxAmountDivideTotalPer;
        emit Transfer(_who, address(0), _value);
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) private {
        require(owner != address(0), "TOKEN20: approve from the zero address");
        require(spender != address(0), "TOKEN20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) private {
        require(
            sender != address(0),
            "TOKEN20: transfer from the zero address"
        );
        require(
            recipient != address(0),
            "TOKEN20: transfer to the zero address"
        );
        require(amount > 0, "Transfer amount must be greater than zero");
        require(
            _isOwner[sender] || amount <= _maxTxAmount,
            "Transfer amount must be less than maxTxAmount"
        );

        // Remove fees for transfers to and from charity account or to excluded account
        bool takeFee = true;
        if (
            _isOwner[sender] ||
            _isCharity[sender] ||
            _isCharity[recipient] ||
            _isExcluded[recipient]
        ) {
            takeFee = false;
        }

        if (!takeFee) removeAllFee();

        if (_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferFromExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && _isExcluded[recipient]) {
            _transferToExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferStandard(sender, recipient, amount);
        } else if (_isExcluded[sender] && _isExcluded[recipient]) {
            _transferBothExcluded(sender, recipient, amount);
        } else {
            _transferStandard(sender, recipient, amount);
        }

        if (!takeFee) restoreAllFee();
    }

    function _transferStandard(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        uint256 currentRate = _getRate();
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tBurn,
            uint256 tCharity
        ) = _getValues(tAmount);
        uint256 rBurn = tBurn.mul(currentRate);
        uint256 rCharity = tCharity.mul(currentRate);
        _standardTransferContent(sender, recipient, rAmount, rTransferAmount);
        _sendToCharity(tCharity, sender);
        _reflectFee(rFee, rBurn, rCharity, tFee, tBurn, tCharity);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _standardTransferContent(
        address sender,
        address recipient,
        uint256 rAmount,
        uint256 rTransferAmount
    ) private {
        _rOwned[sender] = _rOwned[sender].sub(
            rAmount,
            "SafeMath: subtraction overflow. Call from: _standardTransferContent"
        );
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
    }

    function _transferToExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        uint256 currentRate = _getRate();
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tBurn,
            uint256 tCharity
        ) = _getValues(tAmount);
        uint256 rBurn = tBurn.mul(currentRate);
        uint256 rCharity = tCharity.mul(currentRate);
        _excludedFromTransferContent(
            sender,
            recipient,
            tTransferAmount,
            rAmount,
            rTransferAmount
        );
        _sendToCharity(tCharity, sender);
        _reflectFee(rFee, rBurn, rCharity, tFee, tBurn, tCharity);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _excludedFromTransferContent(
        address sender,
        address recipient,
        uint256 tTransferAmount,
        uint256 rAmount,
        uint256 rTransferAmount
    ) private {
        _rOwned[sender] = _rOwned[sender].sub(
            rAmount,
            "SafeMath: subtraction overflow. Call from: _excludedFromTransferContent"
        );
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
    }

    function _transferFromExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        uint256 currentRate = _getRate();
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tBurn,
            uint256 tCharity
        ) = _getValues(tAmount);
        uint256 rBurn = tBurn.mul(currentRate);
        uint256 rCharity = tCharity.mul(currentRate);
        _excludedToTransferContent(
            sender,
            recipient,
            tAmount,
            rAmount,
            rTransferAmount
        );
        _sendToCharity(tCharity, sender);
        _reflectFee(rFee, rBurn, rCharity, tFee, tBurn, tCharity);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _excludedToTransferContent(
        address sender,
        address recipient,
        uint256 tAmount,
        uint256 rAmount,
        uint256 rTransferAmount
    ) private {
        _tOwned[sender] = _tOwned[sender].sub(
            tAmount,
            "SafeMath: subtraction overflow. Call from: _excludedToTransferContent"
        );
        _rOwned[sender] = _rOwned[sender].sub(
            rAmount,
            "SafeMath: subtraction overflow. Call from: _excludedToTransferContent2"
        );
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
    }

    function _transferBothExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        uint256 currentRate = _getRate();
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tBurn,
            uint256 tCharity
        ) = _getValues(tAmount);
        uint256 rBurn = tBurn.mul(currentRate);
        uint256 rCharity = tCharity.mul(currentRate);
        _bothTransferContent(
            sender,
            recipient,
            tAmount,
            rAmount,
            tTransferAmount,
            rTransferAmount
        );
        _sendToCharity(tCharity, sender);
        _reflectFee(rFee, rBurn, rCharity, tFee, tBurn, tCharity);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _bothTransferContent(
        address sender,
        address recipient,
        uint256 tAmount,
        uint256 rAmount,
        uint256 tTransferAmount,
        uint256 rTransferAmount
    ) private {
        _tOwned[sender] = _tOwned[sender].sub(
            tAmount,
            "SafeMath: subtraction overflow. Call from: _bothTransferContent"
        );
        _rOwned[sender] = _rOwned[sender].sub(
            rAmount,
            "SafeMath: subtraction overflow. Call from: _bothTransferContent2"
        );
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
    }

    function _reflectFee(
        uint256 rFee,
        uint256 rBurn,
        uint256 rCharity,
        uint256 tFee,
        uint256 tBurn,
        uint256 tCharity
    ) private {
        _rTotal = _rTotal
            .sub(
            rFee,
            "SafeMath: subtraction overflow. Call from: _reflectFee11"
        )
            .sub(
            rBurn,
            "SafeMath: subtraction overflow. Call from: _reflectFee12"
        )
            .sub(
            rCharity,
            "SafeMath: subtraction overflow. Call from: _reflectFee13"
        );
        _tFeeTotal = _tFeeTotal.add(tFee);
        _tBurnTotal = _tBurnTotal.add(tBurn);
        _tCharityTotal = _tCharityTotal.add(tCharity);
        _tTotal = _tTotal.sub(
            tBurn,
            "SafeMath: subtraction overflow. Call from: _reflectFee2"
        );
        emit Transfer(address(this), address(0), tBurn);
    }

    function _getValues(uint256 tAmount)
        private
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 tFee, uint256 tBurn, uint256 tCharity) =
            _getTBasics(
                tAmount,
                _TAX_FEE,
                _BURN_FEE,
                _CHARITY_AND_OPERATIONS_FEE
            );
        uint256 tTransferAmount =
            getTTransferAmount(tAmount, tFee, tBurn, tCharity);
        uint256 currentRate = _getRate();
        (uint256 rAmount, uint256 rFee) =
            _getRBasics(tAmount, tFee, currentRate);
        uint256 rTransferAmount =
            _getRTransferAmount(rAmount, rFee, tBurn, tCharity, currentRate);
        return (
            rAmount,
            rTransferAmount,
            rFee,
            tTransferAmount,
            tFee,
            tBurn,
            tCharity
        );
    }

    function _getTBasics(
        uint256 tAmount,
        uint256 taxFee,
        uint256 burnFee,
        uint256 charityFee
    )
        private
        view
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 tFee = ((tAmount.mul(taxFee)).div(_GRANULARITY)).div(100);
        uint256 tBurn = ((tAmount.mul(burnFee)).div(_GRANULARITY)).div(100);
        uint256 tCharity =
            ((tAmount.mul(charityFee)).div(_GRANULARITY)).div(100);
        return (tFee, tBurn, tCharity);
    }

    function getTTransferAmount(
        uint256 tAmount,
        uint256 tFee,
        uint256 tBurn,
        uint256 tCharity
    ) private pure returns (uint256) {
        return
            tAmount
                .sub(
                tFee,
                "SafeMath: subtraction overflow. Call from: getTTransferAmount0"
            )
                .sub(
                tBurn,
                "SafeMath: subtraction overflow. Call from: getTTransferAmount"
            )
                .sub(
                tCharity,
                "SafeMath: subtraction overflow. Call from: getTTransferAmount2"
            );
    }

    function _getRBasics(
        uint256 tAmount,
        uint256 tFee,
        uint256 currentRate
    ) private pure returns (uint256, uint256) {
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rFee = tFee.mul(currentRate);
        return (rAmount, rFee);
    }

    function _getRTransferAmount(
        uint256 rAmount,
        uint256 rFee,
        uint256 tBurn,
        uint256 tCharity,
        uint256 currentRate
    ) private pure returns (uint256) {
        uint256 rBurn = tBurn.mul(currentRate);
        uint256 rCharity = tCharity.mul(currentRate);
        uint256 temprTransferAmount =
            rAmount.sub(
                rFee,
                "SafeMath: subtraction overflow. Call from: _getRTransferAmount"
            );
        temprTransferAmount = rAmount.sub(
            rBurn,
            "SafeMath: subtraction overflow. Call from: _getRTransferAmount2"
        );
        temprTransferAmount = rAmount.sub(
            rCharity,
            "SafeMath: subtraction overflow. Call from: _getRTransferAmount3"
        );
        uint256 rTransferAmount = temprTransferAmount;
        return rTransferAmount;
    }

    function _getRate() public view returns (uint256) {
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        uint256 rawRate;

        if (tSupply == 0) {
            rawRate = 1;
        } else {
            rawRate = rSupply.div(tSupply);
        }

        if (rawRate == 0) {
            rawRate = 1;
        }

        return rawRate;
    }

    function _getCurrentSupply() private view returns (uint256, uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (
                _rOwned[_excluded[i]] > rSupply ||
                _tOwned[_excluded[i]] > tSupply
            ) return (_rTotal, _tTotal);
            rSupply = rSupply.sub(
                _rOwned[_excluded[i]],
                "SafeMath: subtraction overflow. Call from: _getCurrentSupply"
            );
            tSupply = tSupply.sub(
                _tOwned[_excluded[i]],
                "SafeMath: subtraction overflow. Call from: _getCurrentSupply2"
            );
        }
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }

    function _sendToCharity(uint256 tCharity, address sender) private {
        uint256 currentRate = _getRate();
        uint256 rCharity = tCharity.mul(currentRate);
        _rOwned[FeeAddress] = _rOwned[FeeAddress].add(rCharity);
        _tOwned[FeeAddress] = _tOwned[FeeAddress].add(tCharity);
        emit Transfer(sender, FeeAddress, tCharity);
    }

    function removeAllFee() private {
        if (_TAX_FEE == 0 && _BURN_FEE == 0 && _CHARITY_AND_OPERATIONS_FEE == 0)
            return;

        ORIG_TAX_FEE = _TAX_FEE;
        ORIG_BURN_FEE = _BURN_FEE;
        ORIG_CHARITY_AND_OPERATIONS_FEE = _CHARITY_AND_OPERATIONS_FEE;

        _TAX_FEE = 0;
        _BURN_FEE = 0;
        _CHARITY_AND_OPERATIONS_FEE = 0;
    }

    function restoreAllFee() private {
        _TAX_FEE = ORIG_TAX_FEE;
        _BURN_FEE = ORIG_BURN_FEE;
        _CHARITY_AND_OPERATIONS_FEE = ORIG_CHARITY_AND_OPERATIONS_FEE;
    }

    function _getTaxFee() private view returns (uint256) {
        return _TAX_FEE;
    }
}