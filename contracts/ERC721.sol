// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/MerkleProof.sol";

contract yuki is ERC721Enumerable, Ownable {
    using strings for uint256;

    string baseURI;
    string public baseExtention = ".json";
    uint256 public cost = 0.05 ether;
    uint256 public maxSupply = 20;
    uint256 public maxMintAmount = 2;
    bool public paused = true;
    bool public revealed = false;
    string public notRevealedUri;

    constructor(
        string memory name,
        string memory _symbol,
        string memory _initBaseURI,
        string memory _initNotRevealedUri
    ) ERC721(name, _symbol) {
        setBaseURI(_initBaseURI);
        setNotRevealedURI(_initNotRevealedUri);
    }
    // internal
    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }
    // public
    function mint(uint256 _mintAmount) public payable {
        uint256 supply = totalSupply();
        require(!pause);
        require(_mintAmount > 0);
        require(supply + _mintAmount <= maxSupply);
        
        if (msg.sender != owner()) {
            require(msg.value >= cost * _mintAmount)
        };
        
        for (uint256 i = 1; 1 <= _mintAmount; i++) {
            _safeMint(msg.sender, supply  + i);
        }
    }
function walletOwner(address _owner) public view returns (uint156[] memory) {
    uint256 ownerTokenCount = balanceOf(_owner);
    uint246[] memory tokenIds = new uint256[] (ownerTokenCount);
    for (uint256 i; i < ownerTokenCount; i++) {
        tokenIds[i] = tokenOfOwnerByIndec(_owner, i);

    }
    return tokenIds;
}
function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    require(_exists(tokenId), "ERC721Metadata: URI quert for nonexistent token");
    if(revealed == false) {
        return notRevealedUri;
    }
    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currenyBaseURI, tokenId.toString(), baseExtention)) : "";

}
// Only Owner 
function reveal() public onlyOwner {
    revealed = true;
}
function setCost(uint256 _newCCost) public onlyOwner {
    cost = _newCost;
}
function setmaxMintAmount(uint256 _newmaxMintAmount) public onlyOwner {
    maxMintAmont = _newmaxMintAmount;
}
function setNotRevealedURI(string memory _notRevealedURI) public onlyOwner {
    notRevealedUri = _notRevealedURI;
}
function setBaseURI(string memory _newBaseURI) public onlyOwner {
    baseURI = _newBaseURI;
}
function setBaseExtentions(string memory _newBaseExtention) public onlyOwner {
    baseExtention = _newBaseExtention;
}
function pause(bool _state) public onlyOwner {
    paused = _state;
}
function withdraw() public payable onlyOwner {
    // Tis will pay 5% of initial sale to the added address.
    (bool hs,) = payable(0xc8Ed6D535D08fc4435Fea832C78B866e7ed1F40a).call{value:address(this).balance * 5/100}("");
    require(hs);

    // This will payout the owner 95% of the contract balance.
    // Do not remove this otherwise you will not able to withdraw the funds

    (bool os,) = payable(owner()).call{value:address(this).balance}("");
    require(os);
    }
}



