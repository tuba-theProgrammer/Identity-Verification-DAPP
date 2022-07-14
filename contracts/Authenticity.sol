//declare the solidity compiler version
pragma solidity ^0.5.12;

//declare the contract
contract Authenticity {

  //declare the event that will be fired when a file is certified.
  event FileCertified(address author, string fileHash, uint timestamp, uint fileSize, string fileExtension);

  //declare a structured data that describes a certified file
  struct FileCertificate {
    address author;
    string fileHash;
    uint timestamp;
    uint fileSize;
    string fileExtension;
  }

  //declare an object that will store the file certificates by hash
  mapping (string => FileCertificate) fileCertificatesMap;

  //function that allows users to certify a file
  function certifyFile(uint fileSize, string memory fileHash, string memory fileExtension) public payable {
    FileCertificate memory newFileCertificate = FileCertificate(msg.sender, fileHash, block.timestamp, fileSize, fileExtension);
    fileCertificatesMap[fileHash] = newFileCertificate;
    emit FileCertified(msg.sender, fileHash, block.timestamp, fileSize, fileExtension);
  }

  


}
