// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/MerkleProof.sol";

contract yuki is ERC721Enumerable, Ownable {
    using strings for uint256;

    string baseURI;
    string public baseExtention = ".json";
    uint256 public maxSupply = 20;
    uint256 public maxMintAmount = 2;
    bool public paused = true;
    bool public revealed = false;
    string public notRevealedUri;

    constructor (
        string memory name,
        string memory _symbol,
        string memory _initNotRevealedUri
    )
    ERC721(name, _symbol) {
        setBaseURI(_initBaseURI);
        setNotRevealedURI(_initNotRevealedUri);
    }
    // internal
}
