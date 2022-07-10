//SPDX-License-Identifier:MIT

pragma solidity ^0.8.3;

contract RAM {
    string public name;
    uint256 public imageCount = 0;
    mapping(uint256 => Image) public images;

    struct Image {
        uint256 id;
        string hash;
        string description;
        address author;
    }

    event ImageCreated(
        uint256 id,
        string hash,
        string description,
        address author
    );

  

    constructor() {
        name = "Random Access Memories";
    }

    //uploadImage() takes the IPFS-hash plus a string as description and store it in a struct
    function uploadImage(string memory _imgHash, string memory _description)
        public
    {
        // Make sure the image hash exists
        require(bytes(_imgHash).length > 0, "Must have HASH");
        // Make sure image description exists
        require(bytes(_description).length > 0, "Must have DESCRIPTION");
        // Make sure uploader address exists
        require(msg.sender != address(0), "Must have AUTHOR");

        // Increment image id
        imageCount++;

        // Add Image to the contract
        images[imageCount] = Image(
            imageCount,
            _imgHash,
            _description,
            msg.sender
        );
        
        emit ImageCreated(imageCount, _imgHash, _description, msg.sender);

    }

    
}
