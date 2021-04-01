pragma solidity >=0.5.0 <0.9.0;

contract Kities {
    uint8 positionX;
    uint8 positionY;
    constructor(uint8 _positionX, uint8 _positionY) public {
        positionX = _positionX;
        positionY = _positionY;
    }

    function getPositionX() public view returns (uint8) {
        return positionX;
    }

    function getPositionY() public view returns (uint8) {
        return positionY;
    }

}