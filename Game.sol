pragma solidity >=0.5.0 <0.9.0;
import "./Kities.sol";
import "./Snake.sol";
import "./Player.sol";
import "./Block.sol";

contract Game {
    Player mPlayer;
    Snake mSnake;
    Kities mKities;
   
    constructor() public {
        mPlayer = new Player("hungpham");
        mSnake = new Snake();
        uint8 positionX = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
        uint8 positionY = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
        mKities = new Kities(positionX, positionY);
    }

    function checkEatKities() public {
        if (mSnake.getBlockSnake()[0].getPositionX()==mKities.getPositionX()&&mSnake.getBlockSnake()[0].getPositionY()==mKities.getPositionY()){
            mSnake.addBlock();
            uint8 positionX = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
            uint8 positionY = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
            mKities = new Kities(positionX, positionY);
        }else{
            mSnake.draw();
        }
    }
    

}