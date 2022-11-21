/**
 *Submitted for verification at Etherscan.io on 2021-08-27
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is no longer needed starting with Solidity 0.8. The compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

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
        return a + b;
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
        return a - b;
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
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
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
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
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
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
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
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
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
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
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
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _setOwner(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
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
        _setOwner(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
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
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

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
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 *
 * Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 */
abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721Metadata is IERC721 {
    /**
     * @dev Returns the token collection name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the token collection symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

/**
 * @dev Required interface of an ERC1155 compliant contract, as defined in the
 * https://eips.ethereum.org/EIPS/eip-1155[EIP].
 *
 * _Available since v3.1._
 */
interface IERC1155 is IERC165 {
    /**
     * @dev Emitted when `value` tokens of token type `id` are transferred from `from` to `to` by `operator`.
     */
    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);

    /**
     * @dev Equivalent to multiple {TransferSingle} events, where `operator`, `from` and `to` are the same for all
     * transfers.
     */
    event TransferBatch(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256[] ids,
        uint256[] values
    );

    /**
     * @dev Emitted when `account` grants or revokes permission to `operator` to transfer their tokens, according to
     * `approved`.
     */
    event ApprovalForAll(address indexed account, address indexed operator, bool approved);

    /**
     * @dev Emitted when the URI for token type `id` changes to `value`, if it is a non-programmatic URI.
     *
     * If an {URI} event was emitted for `id`, the standard
     * https://eips.ethereum.org/EIPS/eip-1155#metadata-extensions[guarantees] that `value` will equal the value
     * returned by {IERC1155MetadataURI-uri}.
     */
    event URI(string value, uint256 indexed id);

    /**
     * @dev Returns the amount of tokens of token type `id` owned by `account`.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function balanceOf(address account, uint256 id) external view returns (uint256);

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {balanceOf}.
     *
     * Requirements:
     *
     * - `accounts` and `ids` must have the same length.
     */
    function balanceOfBatch(address[] calldata accounts, uint256[] calldata ids)
        external
        view
        returns (uint256[] memory);

    /**
     * @dev Grants or revokes permission to `operator` to transfer the caller's tokens, according to `approved`,
     *
     * Emits an {ApprovalForAll} event.
     *
     * Requirements:
     *
     * - `operator` cannot be the caller.
     */
    function setApprovalForAll(address operator, bool approved) external;

    /**
     * @dev Returns true if `operator` is approved to transfer ``account``'s tokens.
     *
     * See {setApprovalForAll}.
     */
    function isApprovedForAll(address account, address operator) external view returns (bool);

    /**
     * @dev Transfers `amount` tokens of token type `id` from `from` to `to`.
     *
     * Emits a {TransferSingle} event.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - If the caller is not `from`, it must be have been approved to spend ``from``'s tokens via {setApprovalForAll}.
     * - `from` must have a balance of tokens of type `id` of at least `amount`.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155Received} and return the
     * acceptance magic value.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) external;

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {safeTransferFrom}.
     *
     * Emits a {TransferBatch} event.
     *
     * Requirements:
     *
     * - `ids` and `amounts` must have the same length.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155BatchReceived} and return the
     * acceptance magic value.
     */
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external;
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
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
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
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
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
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
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
        return functionCallWithValue(target, data, 0, errorMessage);
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
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
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
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) private pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

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
 * @dev String operations.
 */
library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     */
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}

/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {ERC721Enumerable}.
 */
contract ERC721 is Context, ERC165, IERC721, IERC721Metadata {
    using Address for address;
    using Strings for uint256;

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Mapping from token ID to owner address
    mapping(uint256 => address) private _owners;

    // Mapping owner address to token count
    mapping(address => uint256) private _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    // Mapping from owner to operator approvals
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC721Metadata).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721-balanceOf}.
     */
    function balanceOf(address owner) public view virtual override returns (uint256) {
        require(owner != address(0), "ERC721: balance query for the zero address");
        return _balances[owner];
    }

    /**
     * @dev See {IERC721-ownerOf}.
     */
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }

    /**
     * @dev See {IERC721Metadata-name}.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev See {IERC721Metadata-symbol}.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }

    /**
     * @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
     * token will be the concatenation of the `baseURI` and the `tokenId`. Empty
     * by default, can be overriden in child contracts.
     */
    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    /**
     * @dev See {IERC721-approve}.
     */
    function approve(address to, uint256 tokenId) public virtual override {
        address owner = ERC721.ownerOf(tokenId);
        require(to != owner, "ERC721: approval to current owner");

        require(
            _msgSender() == owner || isApprovedForAll(owner, _msgSender()),
            "ERC721: approve caller is not owner nor approved for all"
        );

        _approve(to, tokenId);
    }

    /**
     * @dev See {IERC721-getApproved}.
     */
    function getApproved(uint256 tokenId) public view virtual override returns (address) {
        require(_exists(tokenId), "ERC721: approved query for nonexistent token");

        return _tokenApprovals[tokenId];
    }

    /**
     * @dev See {IERC721-setApprovalForAll}.
     */
    function setApprovalForAll(address operator, bool approved) public virtual override {
        require(operator != _msgSender(), "ERC721: approve to caller");

        _operatorApprovals[_msgSender()][operator] = approved;
        emit ApprovalForAll(_msgSender(), operator, approved);
    }

    /**
     * @dev See {IERC721-isApprovedForAll}.
     */
    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    /**
     * @dev See {IERC721-transferFrom}.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        //solhint-disable-next-line max-line-length
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");

        _transfer(from, to, tokenId);
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        safeTransferFrom(from, to, tokenId, "");
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
        _safeTransfer(from, to, tokenId, _data);
    }

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * `_data` is additional data, it has no specified format and it is sent in call to `to`.
     *
     * This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
     * implement alternative mechanisms to perform token transfer, such as signature-based.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
    }

    /**
     * @dev Returns whether `tokenId` exists.
     *
     * Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
     *
     * Tokens start existing when they are minted (`_mint`),
     * and stop existing when they are burned (`_burn`).
     */
    function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _owners[tokenId] != address(0);
    }

    /**
     * @dev Returns whether `spender` is allowed to manage `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view virtual returns (bool) {
        require(_exists(tokenId), "ERC721: operator query for nonexistent token");
        address owner = ERC721.ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
    }

    /**
     * @dev Safely mints `tokenId` and transfers it to `to`.
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeMint(address to, uint256 tokenId) internal virtual {
        _safeMint(to, tokenId, "");
    }

    /**
     * @dev Same as {xref-ERC721-_safeMint-address-uint256-}[`_safeMint`], with an additional `data` parameter which is
     * forwarded in {IERC721Receiver-onERC721Received} to contract recipients.
     */
    function _safeMint(
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _mint(to, tokenId);
        require(
            _checkOnERC721Received(address(0), to, tokenId, _data),
            "ERC721: transfer to non ERC721Receiver implementer"
        );
    }

    /**
     * @dev Mints `tokenId` and transfers it to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - `to` cannot be the zero address.
     *
     * Emits a {Transfer} event.
     */
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _beforeTokenTransfer(address(0), to, tokenId);

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    /**
     * @dev Destroys `tokenId`.
     * The approval is cleared when the token is burned.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     *
     * Emits a {Transfer} event.
     */
    function _burn(uint256 tokenId) internal virtual {
        address owner = ERC721.ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId);

        // Clear approvals
        _approve(address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);
    }

    /**
     * @dev Transfers `tokenId` from `from` to `to`.
     *  As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     *
     * Emits a {Transfer} event.
     */
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        require(ERC721.ownerOf(tokenId) == from, "ERC721: transfer of token that is not own");
        require(to != address(0), "ERC721: transfer to the zero address");

        _beforeTokenTransfer(from, to, tokenId);

        // Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    /**
     * @dev Approve `to` to operate on `tokenId`
     *
     * Emits a {Approval} event.
     */
    function _approve(address to, uint256 tokenId) internal virtual {
        _tokenApprovals[tokenId] = to;
        emit Approval(ERC721.ownerOf(tokenId), to, tokenId);
    }

    /**
     * @dev Internal function to invoke {IERC721Receiver-onERC721Received} on a target address.
     * The call is not executed if the target address is not a contract.
     *
     * @param from address representing the previous owner of the given token ID
     * @param to target address that will receive the tokens
     * @param tokenId uint256 ID of the token to be transferred
     * @param _data bytes optional data to send along with the call
     * @return bool whether the call correctly returned the expected magic value
     */
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) private returns (bool) {
        if (to.isContract()) {
            try IERC721Receiver(to).onERC721Received(_msgSender(), from, tokenId, _data) returns (bytes4 retval) {
                return retval == IERC721Receiver(to).onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert("ERC721: transfer to non ERC721Receiver implementer");
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    /**
     * @dev Hook that is called before any token transfer. This includes minting
     * and burning.
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, ``from``'s `tokenId` will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {}
}

/**
 * @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721Enumerable is IERC721 {
    /**
     * @dev Returns the total amount of tokens stored by the contract.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns a token ID owned by `owner` at a given `index` of its token list.
     * Use along with {balanceOf} to enumerate all of ``owner``'s tokens.
     */
    function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256 tokenId);

    /**
     * @dev Returns a token ID at a given `index` of all the tokens stored by the contract.
     * Use along with {totalSupply} to enumerate all tokens.
     */
    function tokenByIndex(uint256 index) external view returns (uint256);
}

/**
 * @dev This implements an optional extension of {ERC721} defined in the EIP that adds
 * enumerability of all the token ids in the contract as well as all token ids owned by each
 * account.
 */
abstract contract ERC721Enumerable is ERC721, IERC721Enumerable {
    // Mapping from owner to list of owned token IDs
    mapping(address => mapping(uint256 => uint256)) private _ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) private _ownedTokensIndex;

    // Array with all token ids, used for enumeration
    uint256[] private _allTokens;

    // Mapping from token id to position in the allTokens array
    mapping(uint256 => uint256) private _allTokensIndex;

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, ERC721) returns (bool) {
        return interfaceId == type(IERC721Enumerable).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721Enumerable-tokenOfOwnerByIndex}.
     */
    function tokenOfOwnerByIndex(address owner, uint256 index) public view virtual override returns (uint256) {
        require(index < ERC721.balanceOf(owner), "ERC721Enumerable: owner index out of bounds");
        return _ownedTokens[owner][index];
    }

    /**
     * @dev See {IERC721Enumerable-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _allTokens.length;
    }

    /**
     * @dev See {IERC721Enumerable-tokenByIndex}.
     */
    function tokenByIndex(uint256 index) public view virtual override returns (uint256) {
        require(index < ERC721Enumerable.totalSupply(), "ERC721Enumerable: global index out of bounds");
        return _allTokens[index];
    }

    /**
     * @dev Hook that is called before any token transfer. This includes minting
     * and burning.
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, ``from``'s `tokenId` will be burned.
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, tokenId);

        if (from == address(0)) {
            _addTokenToAllTokensEnumeration(tokenId);
        } else if (from != to) {
            _removeTokenFromOwnerEnumeration(from, tokenId);
        }
        if (to == address(0)) {
            _removeTokenFromAllTokensEnumeration(tokenId);
        } else if (to != from) {
            _addTokenToOwnerEnumeration(to, tokenId);
        }
    }

    /**
     * @dev Private function to add a token to this extension's ownership-tracking data structures.
     * @param to address representing the new owner of the given token ID
     * @param tokenId uint256 ID of the token to be added to the tokens list of the given address
     */
    function _addTokenToOwnerEnumeration(address to, uint256 tokenId) private {
        uint256 length = ERC721.balanceOf(to);
        _ownedTokens[to][length] = tokenId;
        _ownedTokensIndex[tokenId] = length;
    }

    /**
     * @dev Private function to add a token to this extension's token tracking data structures.
     * @param tokenId uint256 ID of the token to be added to the tokens list
     */
    function _addTokenToAllTokensEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    /**
     * @dev Private function to remove a token from this extension's ownership-tracking data structures. Note that
     * while the token is not assigned a new owner, the `_ownedTokensIndex` mapping is _not_ updated: this allows for
     * gas optimizations e.g. when performing a transfer operation (avoiding double writes).
     * This has O(1) time complexity, but alters the order of the _ownedTokens array.
     * @param from address representing the previous owner of the given token ID
     * @param tokenId uint256 ID of the token to be removed from the tokens list of the given address
     */
    function _removeTokenFromOwnerEnumeration(address from, uint256 tokenId) private {
        // To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = ERC721.balanceOf(from) - 1;
        uint256 tokenIndex = _ownedTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary
        if (tokenIndex != lastTokenIndex) {
            uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];

            _ownedTokens[from][tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
            _ownedTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index
        }

        // This also deletes the contents at the last position of the array
        delete _ownedTokensIndex[tokenId];
        delete _ownedTokens[from][lastTokenIndex];
    }

    /**
     * @dev Private function to remove a token from this extension's token tracking data structures.
     * This has O(1) time complexity, but alters the order of the _allTokens array.
     * @param tokenId uint256 ID of the token to be removed from the tokens list
     */
    function _removeTokenFromAllTokensEnumeration(uint256 tokenId) private {
        // To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length - 1;
        uint256 tokenIndex = _allTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
        // rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
        // an 'if' statement (like in _removeTokenFromOwnerEnumeration)
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
        _allTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index

        // This also deletes the contents at the last position of the array
        delete _allTokensIndex[tokenId];
        _allTokens.pop();
    }
}

interface ITriathonLoot {
    function getUserName(uint256 tokenId) external view returns (string memory);
}

interface IBaseProperties {
    function getClassName(string memory input) external pure returns (string memory);
    function getTestCase(string memory input) external pure returns (string memory);
    function getGalaxy(uint256 tokenId, string memory input) external pure returns (string memory);
    function getScarcity(uint256 tokenId) external pure returns (string memory);
    
}

contract WeaponRule is Ownable {
    using SafeMath for uint;
    
    struct AssembleRule {
        string class;       // 4D
        string event_name;  // event name
        uint wings;         // the number of wings needed.
        uint guns;
        uint cannons;
        uint armors;
        uint lasers;
        string uri;
    }
    
    struct UpgradingRule {
        uint amount; // erc20 amount for upgrading 
        uint exp;  // exp for upgrading 
    }
    
    // ------------------- assemble rules -------
    mapping(uint => AssembleRule) public asmRules;                      // --- rules
    uint public asm_rules_number;
    
    // ------------------- attack ----------------
    mapping(string => mapping(string => uint)) public baseAttacks;      // --- base attacks
    mapping(string => uint) public scarcityAttackMuls;                  // -- scarcity for attack
    //mapping(uint => uint) public levelAttackMuls;                       // --- level up for attacks: level => mul 
    
    // ------------------- hp -------------------
    mapping(string => mapping(string => uint)) public initialHps;       // --- hps
    mapping(uint => uint) public maxLevelHPs;                           // --- the max hp for 6 levels: level => max Hp
    uint public hp_reduction_per_battle = 10;                           // --- the hp reduction every time for a battle
    uint public token_amount_per_hp = 3 ether;                          // --- the upgrading token needing for adding 1 hp
    
    // ------------------ upgrade level ---------
    mapping(uint => UpgradingRule) public upgRules;                     // --- upgrading rules: level => UpgradingRule
    
    // ------------------ exp -------------------
    mapping(uint => mapping(string => uint)) public battleExps;               // --- level -> scarcity -> value.
    
    
    constructor() {
        initAssembleRules();
        
        initBaseAttacks();
        
        initScarcityAttackMuls();
        
        //initLevelAttackMuls();
        
        initInitialHps();
        
        //initLevelHpMuls();
        
        initUpgradeRules();
        
        initBattleExps();
    }
    
    // --- assemble rules
    function initAssembleRules() internal {
        AssembleRule memory r1 = AssembleRule (
            "Delusionist",
            "Contract Review",
            3,
            0,
            0,
            0,
            3,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/79.png"
        );
        
        AssembleRule memory r2 = AssembleRule (
            "Delusionist",
            "Contract Deployment",
            3,
            0,
            0,
            0,
            6,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/81.png"
        );
        
        AssembleRule memory r3 = AssembleRule (
            "Destroyer",
            "Fake TX",
            3,
            4,
            2,
            0,
            0,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/33.png"
        );
        
        AssembleRule memory r4 = AssembleRule (
            "Destroyer",
            "Continuous Low Load Operation",
            5,
            2,
            2,
            0,
            0,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/384.png"
        );
        
        AssembleRule memory r5 = AssembleRule (
            "Destroyer",
            "Pressure Test",
            1,
            0,
            4,
            0,
            0,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/210.png"
        );
        
        AssembleRule memory r6 = AssembleRule (
            "Destroyer",
            "Spike Testing",
            0,
            2,
            4,
            0,
            0,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/267.png"
        );
        
        AssembleRule memory r7 = AssembleRule (
            "Daemon",
            "Increasing Nodes",
            3,
            0,
            0,
            6,
            0,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/155.png"
        );
        
        AssembleRule memory r8 = AssembleRule (
            "Daemon",
            "Reducing Nodes",
            3,
            0,
            0,
            1,
            0,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/176.png"
        );
        
        AssembleRule memory r9 = AssembleRule (
            "Daemon",
            "Data Consistency",
            3,
            0,
            0,
            4,
            0,
            "https://github.com/TRIAS-DAO/nft_pics/blob/main/polymerization/315.png"
        );
        
        asmRules[79] = r1;
        asmRules[81] = r2;
        asmRules[33] = r3;
        asmRules[384] = r4;
        asmRules[210] = r5;
        asmRules[267] = r6;
        asmRules[155] = r7;
        asmRules[176] = r8;
        asmRules[315] = r9;
        
        asm_rules_number = 9;
    }
    function setRule(uint pic_id, string memory catalog, string memory name, uint[5] memory parts, string memory uri) external onlyOwner() {
        AssembleRule memory new_kind = AssembleRule (
            catalog,
            name,
            parts[0],
            parts[1],
            parts[2],
            parts[3],
            parts[4],
            uri
        );
        if (asmRules[pic_id].wings != 0 && asmRules[pic_id].guns != 0 
            && asmRules[pic_id].cannons != 0 && asmRules[pic_id].armors != 0 && asmRules[pic_id].lasers != 0) {
            asm_rules_number ++;
        }
        asmRules[pic_id] = new_kind;
        
    }
    function getRule(uint pic_id) public view returns (uint[5] memory ) {
        AssembleRule memory r = asmRules[pic_id];
        uint[5] memory parts_needed;
        parts_needed[0] = r.wings;
        parts_needed[1] = r.guns;
        parts_needed[2] = r.cannons;
        parts_needed[3] = r.armors;
        parts_needed[4] = r.lasers;
        return parts_needed;
    }
    function getRuleClass(uint pic_id) public view returns (string memory) {
        string memory class = asmRules[pic_id].class;
        return class;
    }
    
    // --- attack value
    function initBaseAttacks() internal {
        baseAttacks["Delusionist"]["Contract Review"] = 60;
        baseAttacks["Delusionist"]["Contract Deployment"] = 62;
        
        baseAttacks["Destroyer"]["Fake TX"] = 90;
        baseAttacks["Destroyer"]["Continuous Low Load Operation"] = 93;
        baseAttacks["Destroyer"]["Pressure Test"] = 95;
        baseAttacks["Destroyer"]["Spike Testing"] = 97;
        
        baseAttacks["Daemon"]["Increasing Nodes"] = 126;
        baseAttacks["Daemon"]["Reducing Nodes"] = 130;
        baseAttacks["Daemon"]["Data Consistency"] = 134;
    }
    function setBaseAttack(string memory catalog, string memory name, uint value) external onlyOwner() {
        baseAttacks[catalog][name] = value;
    }
    function initScarcityAttackMuls() internal { // using: div 100.
        scarcityAttackMuls["Rainbow"] = 100;
        
        scarcityAttackMuls["Poem"] = 100;
        
        scarcityAttackMuls["Pride"] = 105;
        
        scarcityAttackMuls["Gleam"] = 105;
        
        scarcityAttackMuls["Flood"] = 110;
        
        scarcityAttackMuls["Drag"] = 110;
        
        scarcityAttackMuls["Free"] = 115;
        
        scarcityAttackMuls["Push"] = 115;
        
        scarcityAttackMuls["Gratitude"] = 120;
        
        scarcityAttackMuls["Nature"] = 120;
        
        scarcityAttackMuls["Move"] = 125;
        
        scarcityAttackMuls["Limite"] = 125;
    }
    function setScarcityMul(string memory scarcity, uint value) external onlyOwner() {
        scarcityAttackMuls[scarcity] = value;
    }
    /*function initLevelAttackMuls() internal { // --- level for attack:   level => mul  in use, must div 10
        levelAttackMuls[1] = 10;
        levelAttackMuls[2] = 20;
        levelAttackMuls[3] = 35;
        levelAttackMuls[4] = 50;
        levelAttackMuls[5] = 68;
        levelAttackMuls[6] = 89;
    }
    function setLevelAttackMul(uint level, uint value) external onlyOwner() {
        levelAttackMuls[level] = value;
    }*/

    //function getAttack(string memory class, string memory name, string memory scarcity) external view returns (uint) {
    function getAttack(string memory catalog, string memory name, string memory scarcity) external view returns (uint) {
        return baseAttacks[catalog][name].mul(scarcityAttackMuls[scarcity]).div(100);
    }
    
    // --- hp 
    function initInitialHps() internal {
        initialHps["Delusionist"]["Contract Review"] = 20;
        initialHps["Delusionist"]["Contract Deployment"] = 22;
        
        initialHps["Destroyer"]["Fake TX"] = 30;
        initialHps["Destroyer"]["Continuous Low Load Operation"] = 33;
        initialHps["Destroyer"]["Pressure Test"] = 36;
        initialHps["Destroyer"]["Spike Testing"] = 39;
        
        initialHps["Daemon"]["Increasing Nodes"] = 42;
        initialHps["Daemon"]["Reducing Nodes"] = 46;
        initialHps["Daemon"]["Data Consistency"] = 50;
        
        maxLevelHPs[1] = 100;
        maxLevelHPs[2] = 300;
        maxLevelHPs[3] = 900;
        maxLevelHPs[4] = 2700;
        maxLevelHPs[5] = 6000;
        maxLevelHPs[6] = 9000;
    }
    function setInitialHp(string memory catalog, string memory name, uint value) external onlyOwner() {
        initialHps[catalog][name] = value;
    }
    function setHPReduction(uint256 value) external onlyOwner() {
        hp_reduction_per_battle = value;
    }
    function setLevelMaxHp(uint256 level, uint256 value) external onlyOwner() {
        maxLevelHPs[level] = value;
    }
    /*function getHp(string memory class, string memory name, uint level) external view returns (uint) {
        return initialHps[class][name].mul(levelHpMuls[level]).div(10);
    }*/
    
    /*// --- level for hp
    function initLevelHpMuls() internal {
        levelHpMuls[1] = 10;
        levelHpMuls[2] = 15;
        levelHpMuls[3] = 20;
        levelHpMuls[4] = 30;
        levelHpMuls[5] = 45;
        levelHpMuls[6] = 60;
    }
    function setLevelHpMul(uint level, uint value) external onlyOwner() {
        levelHpMuls[level] = value;
    }*/
    
    // --- Upgrading Rule
    function initUpgradeRules() internal {
        UpgradingRule memory n1 = UpgradingRule(4000, 300);
        UpgradingRule memory n2 = UpgradingRule(8000, 600);
        UpgradingRule memory n3 = UpgradingRule(20000, 900);
        UpgradingRule memory n4 = UpgradingRule(60000, 1440);
        UpgradingRule memory n5 = UpgradingRule(150000, 2100);
        
        upgRules[1] = n1;
        upgRules[2] = n2;
        upgRules[3] = n3;
        upgRules[4] = n4;
        upgRules[5] = n5;
    }
    function setUpgradeRule(uint level, uint tokenAmount, uint exp) external onlyOwner() {
        UpgradingRule memory n = UpgradingRule(tokenAmount, exp);
        upgRules[level] = n;
    }
    function getUpgradeNeedingTokenAmount(uint level) public view returns (uint) {
        return upgRules[level].amount;
    }
    function getUpgradeNeedingExp(uint level) external view returns (uint) {
        return upgRules[level].exp;
    }
    function setHPUpgradingTokenAmount(uint value) external onlyOwner() {       // --- set the upgrading token amount for adding 1 hp
        token_amount_per_hp = value;
    }
    
    // --- exp
    function initBattleExps() internal {
        battleExps[1]["Rainbow"] = 10;
        battleExps[1]["Poem"] = 10;
        battleExps[1]["Pride"] = 12;
        battleExps[1]["Gleam"] = 12;
        battleExps[1]["Flood"] = 15;
        battleExps[1]["Drag"] = 15;
        battleExps[1]["Free"] = 18;
        battleExps[1]["Push"] = 18;
        battleExps[1]["Gratitude"] = 22;
        battleExps[1]["Nature"] = 22;
        battleExps[1]["Move"] = 25;
        battleExps[1]["Limite"] = 25;
        
        battleExps[2]["Rainbow"] = 15;
        battleExps[2]["Poem"] = 15;
        battleExps[2]["Pride"] = 18;
        battleExps[2]["Gleam"] = 18;
        battleExps[2]["Flood"] = 22;
        battleExps[2]["Drag"] = 22;
        battleExps[2]["Free"] = 25;
        battleExps[2]["Push"] = 25;
        battleExps[2]["Gratitude"] = 28;
        battleExps[2]["Nature"] = 28;
        battleExps[2]["Move"] = 30;
        battleExps[2]["Limite"] = 30;
        
        battleExps[3]["Rainbow"] = 18;
        battleExps[3]["Poem"] = 18;
        battleExps[3]["Pride"] = 21;
        battleExps[3]["Gleam"] = 21;
        battleExps[3]["Flood"] = 26;
        battleExps[3]["Drag"] = 26;
        battleExps[3]["Free"] = 30;
        battleExps[3]["Push"] = 30;
        battleExps[3]["Gratitude"] = 33;
        battleExps[3]["Nature"] = 33;
        battleExps[3]["Move"] = 36;
        battleExps[3]["Limite"] = 36;
        
        battleExps[4]["Rainbow"] = 21;
        battleExps[4]["Poem"] = 21;
        battleExps[4]["Pride"] = 25;
        battleExps[4]["Gleam"] = 25;
        battleExps[4]["Flood"] = 31;
        battleExps[4]["Drag"] = 31;
        battleExps[4]["Free"] = 36;
        battleExps[4]["Push"] = 36;
        battleExps[4]["Gratitude"] = 40;
        battleExps[4]["Nature"] = 40;
        battleExps[4]["Move"] = 43;
        battleExps[4]["Limite"] = 43;
        
        battleExps[5]["Rainbow"] = 25;
        battleExps[5]["Poem"] = 25;
        battleExps[5]["Pride"] = 30;
        battleExps[5]["Gleam"] = 30;
        battleExps[5]["Flood"] = 37;
        battleExps[5]["Drag"] = 37;
        battleExps[5]["Free"] = 43;
        battleExps[5]["Push"] = 43;
        battleExps[5]["Gratitude"] = 48;
        battleExps[5]["Nature"] = 48;
        battleExps[5]["Move"] = 51;
        battleExps[5]["Limite"] = 51;
        
        battleExps[6]["Rainbow"] = 30;
        battleExps[6]["Poem"] = 30;
        battleExps[6]["Pride"] = 36;
        battleExps[6]["Gleam"] = 36;
        battleExps[6]["Flood"] = 44;
        battleExps[6]["Drag"] = 44;
        battleExps[6]["Free"] = 51;
        battleExps[6]["Push"] = 51;
        battleExps[6]["Gratitude"] = 57;
        battleExps[6]["Nature"] = 57;
        battleExps[6]["Move"] = 61;
        battleExps[6]["Limite"] = 61;
    }
    function setExp(uint level, string memory scarcity, uint value) external onlyOwner() {
        battleExps[level][scarcity] = value;
    }
    
    // --- infos
    function getEventName(uint pic_id) external view returns (string memory) {
        return asmRules[pic_id].event_name;
    }
    function getPicURL(uint pic_id) external view returns (string memory) {
        return asmRules[pic_id].uri;
    }
}

contract WeaponHelper is Ownable {
    using SafeMath for uint;
    
    address public _nft721;
    address public _nft721_lib;
    address public _nft1155;
    address public _rule;
    
    // --- the address who receive the upgrading token
    address public _receiver;
    
    // --- upgrading with the token
    address public _upgrade_token;
    
    // --- allow other address to add battle time for NFT
    mapping(address => bool) public approves;
    
    constructor (address nft721_, address nft721_lib_, address nft1155_, address rule_, address receiver_, address upgrade_token_) {
        _nft721 = nft721_;
        _nft721_lib = nft721_lib_;
        _nft1155 = nft1155_;
        
        _rule = rule_;
        
        _receiver = receiver_;
        
        _upgrade_token = upgrade_token_;
    }
    
    // ---------------------------- setter --------------------------
    function set721(address addr) external onlyOwner() {
        _nft721 = addr;
    }
    function set721Lib(address addr) external onlyOwner() {
        _nft1155 = addr;
    }
    function set1155(address addr) external onlyOwner() {
        _nft1155 = addr;
    }
    function setReceiver(address receiver_) external onlyOwner() {
        _receiver = receiver_;
    }
    function setUpgradeToken(address addr) external onlyOwner() {   //set the erc20 token to be used for upgraing the level of this nft.
        _upgrade_token = addr;
    }
    
    // ---------------------- transfer token ------------------------
    function transferTokenForCreating(address sender, uint pic_id, uint token721Id) public {
        IERC721(_nft721).safeTransferFrom(sender, _receiver, token721Id);
        
        uint256[5] memory amounts = WeaponRule(_rule).getRule(pic_id);
        for (uint i = 0; i < 5; i++) {
            if (amounts[i] != 0) {
                IERC1155(_nft1155).safeTransferFrom(sender, _receiver, i, amounts[0],  bytes("0x00"));
            }
        }
    }
    function transferTokenForUpgrading(address sender, uint level) public { // --- transfer token to receiver. 1 upgraing, 2 add hp.
        uint amount = WeaponRule(_rule).getUpgradeNeedingTokenAmount(level);
        IERC20(_upgrade_token).transferFrom(sender, _receiver, amount);
    }
    function transferTokenForAddingHp(address sender, uint amount) public {
        IERC20(_upgrade_token).transferFrom(sender, _receiver, amount);
    }
    
    // --- set the address who can add the battleCount of the nft token
    function setApprove(address addr, bool value) external onlyOwner() {
        approves[addr] = value;
    }
    function approved(address sender) external view returns (bool) {
        return approves[sender];
    }
    
    // info
    function ownerOf721(uint tokenId) external view returns (address) {
        return IERC721(_nft721).ownerOf(tokenId);
    }
    function classOf721(uint tokenId) public view returns (string memory) {
        return ITriathonLoot(_nft721).getUserName(tokenId);
    }
    /*function eventNameOf721(uint pic_id) external returns (string memory) {
        return WeaponRule(_rule).getEventName(pic_id);
    }*/
    function scarcityOf721(uint tokenId) external view returns (string memory) {
        return IBaseProperties(_nft721_lib).getScarcity(tokenId);
    }
    
    /*function initialAttackOfPoly(string memory class, string memory name, uint token721Id) external returns (uint) {
        string memory scarcity = IBaseProperties(_nft721_lib).getScarcity(token721Id);
        return WeaponRule(_rule).getAttack(class, name, scarcity, 1);
    }*/
    /*function initailHPofPoly(string memory class, string memory name) external returns (uint) {
        return WeaponRule(_rule).initialHps(class, name);
    }*/
    
    
    /*function exp(uint tokenId, string memory scarcity, uint battleCount) external view returns (uint) {
        uint scarcityAttackMul = WeaponRule(_rule).scarcityAttackMuls(scarcity);
        return battleCount.mul(scarcityAttackMul).div(100);
    }*/
    
    function checkTokenAndPic(uint tokenId, uint pic_id) external view returns (bool) {
        string memory token_class = classOf721(tokenId);
        string memory pic_class = WeaponRule(_rule).getRuleClass(pic_id);
        return keccak256(bytes(token_class)) == keccak256(bytes(pic_class));
    }
}

contract Weapons is Ownable, ERC721Enumerable, IERC721Receiver {
    using SafeMath for uint;
    
    struct Weapon {
        string class;   // 4D
        string name;    // name of event
        string scarcity;
        uint pic_id;    // cannot be zero!!!!
        uint level;     // 1,2,3..6
        uint attack;    // harm value
        uint hp;        // blood
        uint battleCounts;
        uint exp;
    }
    
    /*string constant private D1 = "Destroyer";
    string constant private D2 = "Delusionist";
    string constant private D3 = "Daemon";
    string constant private D4 = "Dungeon";*/
    /*address private _nft721;
    address private _nft721_lib;
    address private _nft1155;
    address private _weapon_rule;*/

    event Create(uint tokenId, uint pic_id, string catalog, string name);
    event Battle(uint tokenId, uint count);  // count = added count
    event Upgrade(uint tokenId, uint level); // level = upgraded level
    event ReduceHP(uint tokenId, uint hp);   // hp = redeced hp
    event AddHP(uint tokenId, uint hp);      // hp = added hp
    
    mapping(uint => Weapon) public weapons;
    
    address private _helper;
    address private _rule;

    constructor(address rule_, address helper_) ERC721("Weapon NFT", "WEAPON") {
        _helper = helper_;
        _rule = rule_;
    }
    
    /*function setHelper(address addr) external onlyOwner() {
        _helper = addr;
    }
    function setRule(address addr) external onlyOwner() {
        _rule = addr;
    }*/
    
    // create new nft with nft721 and nft1155
    function create(uint pic_id, uint256 token721Id) external {
        require(weapons[token721Id].pic_id == 0, "have created before.");
        require(_msgSender() == WeaponHelper(_helper).ownerOf721(token721Id), "cannot use other people's token.");
        require(WeaponHelper(_helper).checkTokenAndPic(token721Id, pic_id), "unallowded using this loot nft to compose this poly nft.");
        
        // 1. transfer ERC721 and ERC1155s to this contract.
        WeaponHelper(_helper).transferTokenForCreating(_msgSender(), pic_id, token721Id);
        
        // 2. construct a new weapon 
        Weapon memory w;
        w.class = WeaponHelper(_helper).classOf721(token721Id); 
        w.name = WeaponRule(_rule).getEventName(pic_id);
        w.scarcity = WeaponHelper(_helper).scarcityOf721(token721Id);
        w.pic_id = pic_id;
        w.level = 1;
        w.attack = WeaponRule(_rule).getAttack(w.class, w.name, w.scarcity);
        w.hp = WeaponRule(_rule).initialHps(w.class, w.name);
        w.exp = 0;

        weapons[token721Id] = w;

        // 3. mint 
        _safeMint(_msgSender(), token721Id);
        
        emit Create(token721Id, pic_id, w.class, w.name);
    }
    
    function battle(uint tokenId) external {
        require(WeaponHelper(_helper).approved(_msgSender()), "cannot access to add counts");

        Weapon storage w = weapons[tokenId];
        
        uint hp_reduction = WeaponRule(_rule).hp_reduction_per_battle();
        require(w.hp >= hp_reduction, "hp not enough.");
        
        w.hp = w.hp.sub(hp_reduction);
        
        w.battleCounts++;
        w.exp += WeaponRule(_rule).battleExps(w.level, w.scarcity);
        
        emit Battle(tokenId, weapons[tokenId].battleCounts);
    }
    
    function upgrade(uint256 tokenId) external isTokenOwner(tokenId) {
        // 1. check level
        Weapon storage w = weapons[tokenId];
        uint level = w.level;
        require(level >= 1 && level <= 5, "level is unupgradable.");
        
        // 2. check exp
        //uint curExp = getEXP(tokenId);
        uint needingExp = WeaponRule(_rule).getUpgradeNeedingExp(level);
        require(w.exp >= needingExp, "exp is not enough.");
        
        // 3. transfer erc20 token to receiver
        WeaponHelper(_helper).transferTokenForUpgrading(_msgSender(), level);
        
        // 4. upgrade
        //string memory scarcity = IBaseProperties(_nft721_lib).getScarcity(tokenId);
        w.attack = w.attack.mul(15).div(10); //WeaponRule(_rule).getAttack(w.class, w.name, w.scarcity, w.level);
        w.hp = w.hp.add(level.mul(100));
        w.level++;
        
        emit Upgrade(tokenId, weapons[tokenId].level);
    }

    function heal(uint256 tokenId, uint256 hp_wanted) external {
        require(hp_wanted >= 5, "must more or equal to 5.");
        
        // check
        uint maxHp = WeaponRule(_rule).maxLevelHPs(weapons[tokenId].level);
        require(weapons[tokenId].hp.add(hp_wanted) <= maxHp, "to much hp to add");
        
        // token transfer
        uint256 total = WeaponRule(_rule).token_amount_per_hp().mul(hp_wanted);
        WeaponHelper(_helper).transferTokenForAddingHp(_msgSender(), total);
        
        // add hp
        weapons[tokenId].hp = weapons[tokenId].hp.add(hp_wanted);
        
        emit AddHP(tokenId, weapons[tokenId].hp);
    }
    
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string[15] memory parts;
        Weapon memory w = weapons[tokenId];
        string memory uri = WeaponRule(_rule).getPicURL(w.pic_id);
        
        parts[0] = '{"name": "';
        parts[1] = w.class;
        parts[2] = '", "id": "';
        parts[3] = Strings.toString(tokenId);
        parts[4] = '", "level": "';
        parts[5] = Strings.toString(w.level);
        parts[6] = '", "attack": "';
        parts[7] = Strings.toString(w.attack);
        parts[8] = '", "hp": "';
        parts[9] = Strings.toString(w.hp);
        parts[10] = '", "description": "';
        parts[11] = w.name;
        parts[12] = '", "image": "';
        parts[13] = uri;
        parts[14] = '?raw=true"}';
        
        string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7]));
        output = string(abi.encodePacked(output, parts[8], parts[9], parts[10], parts[11], parts[12], parts[13], parts[14]));
        
        
        string memory json = Base64.encode(bytes(output));
        output = string(abi.encodePacked('data:application/json;base64,', json));
        return output;
    }
    
    function weapon(uint256 tokenId) external view returns (uint256[3] memory) {
        uint256[3] memory ret;
        ret[0] = weapons[tokenId].level;     // 1,2,3..6
        ret[1] = weapons[tokenId].attack;    // harm value
        ret[2] = weapons[tokenId].hp;        // blood
        return ret;
    }

    function onERC721Received(address, address, uint256, bytes calldata) external override pure returns (bytes4) {
        return this.onERC721Received.selector;
    }

    function onERC1155Received(address, address, uint256, uint256, bytes calldata) external pure returns(bytes4) {
        return this.onERC1155Received.selector;
    }
    
    // pool has created.
    modifier isTokenOwner(uint tokenId) {
        require(_msgSender() == ownerOf(tokenId), "cannot use other people's token.");
        _;
    }
}

/// [MIT License]
/// @title Base64
/// @notice Provides a function for encoding some bytes in base64
/// @author Brecht Devos <brecht@loopring.org>
library Base64 {
    bytes internal constant TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    /// @notice Encodes some bytes to the base64 representation
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";

        // multiply by 4/3 rounded up
        uint256 encodedLen = 4 * ((len + 2) / 3);

        // Add some extra buffer at the end
        bytes memory result = new bytes(encodedLen + 32);

        bytes memory table = TABLE;

        assembly {
            let tablePtr := add(table, 1)
            let resultPtr := add(result, 32)

            for {
                let i := 0
            } lt(i, len) {

            } {
                i := add(i, 3)
                let input := and(mload(add(data, i)), 0xffffff)

                let out := mload(add(tablePtr, and(shr(18, input), 0x3F)))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(12, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(6, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(input, 0x3F))), 0xFF))
                out := shl(224, out)

                mstore(resultPtr, out)

                resultPtr := add(resultPtr, 4)
            }

            switch mod(len, 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }

            mstore(result, encodedLen)
        }

        return string(result);
    }
}