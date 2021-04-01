pragma solidity >=0.5.0  <0.9.0;

import './Block.sol';

contract Snake {
    uint8 length = 3;
    Block[] blockSnake;
    string direction;
    

    constructor() public {
        uint8 positionX = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
        uint8 positionY = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
        Block b = new Block(positionX, positionY);
        blockSnake.push(b);
        uint8 directionInt = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
        if ( directionInt%4 == 0) {
            setDirection("left");
            Block b1 = new Block(positionX, positionY+1);
            blockSnake.push(b1);
            Block b2 = new Block(positionX, positionY+2);
            blockSnake.push(b2);
        }else if(directionInt%4 == 1) {
            setDirection("right");
            Block b1 = new Block(positionX, positionY-1);
            blockSnake.push(b1);
            Block b2 = new Block(positionX, positionY-2);
            blockSnake.push(b2);
        }else if(directionInt%4 == 2){
            setDirection("down");
            Block b1 = new Block(positionX-1, positionY);
            blockSnake.push(b1);
            Block b2 = new Block(positionX-2, positionY);
            blockSnake.push(b2);
        }else{
            setDirection("up");
            Block b1 = new Block(positionX+1, positionY);
            blockSnake.push(b1);
            Block b2 = new Block(positionX+2, positionY);
            blockSnake.push(b2);
        }
    }
    function moveLeft() public {
        string memory left = "left";
        string memory right = "right";
        require(keccak256(bytes(getDirection()))!=keccak256(bytes(right))&&keccak256(bytes(getDirection()))!=keccak256(bytes(left)));
        drawLeft();
        setDirection("left");
    }

    function drawLeft() public {
        for (uint256 i=blockSnake.length-1; i>=1; i--){
            blockSnake[i].setPositionX(blockSnake[i-1].getPositionX());
            blockSnake[i].setPositionY(blockSnake[i-1].getPositionY());
        }
        blockSnake[0].setPositionY(blockSnake[0].getPositionY()-1);
    }

    function moveRight() public {
        string memory left = "left";
        string memory right = "right";
        require(keccak256(bytes(getDirection()))!=keccak256(bytes(right))&&keccak256(bytes(getDirection()))!=keccak256(bytes(left)));
        drawRight();
        setDirection("right");
    }

    function drawRight() public {
        for (uint256 i=blockSnake.length-1; i>=1; i--){
            blockSnake[i].setPositionX(blockSnake[i-1].getPositionX());
            blockSnake[i].setPositionY(blockSnake[i-1].getPositionY());
        }
        blockSnake[0].setPositionY(blockSnake[0].getPositionY()+1);
    }

    function moveDown() public {
        string memory up = "up";
        string memory down = "down";
        require(keccak256(bytes(getDirection()))!=keccak256(bytes(down))&&keccak256(bytes(getDirection()))!=keccak256(bytes(up)));
        drawDown();
        setDirection("down");
    }

    function drawDown() public {
        for (uint256 i=blockSnake.length-1; i>=1; i--){
            blockSnake[i].setPositionX(blockSnake[i-1].getPositionX());
            blockSnake[i].setPositionY(blockSnake[i-1].getPositionY());
        }
        blockSnake[0].setPositionX(blockSnake[0].getPositionY()+1);
    }

    function moveUp() public {
        string memory up = "up";
        string memory down = "down";
        require(keccak256(bytes(getDirection()))!=keccak256(bytes(down))&&keccak256(bytes(getDirection()))!=keccak256(bytes(up)));
        drawUp();
        setDirection("up");
    }

    function drawUp() public {
        for (uint256 i=blockSnake.length-1; i>=1; i--){
            blockSnake[i].setPositionX(blockSnake[i-1].getPositionX());
            blockSnake[i].setPositionY(blockSnake[i-1].getPositionY());
        }
        blockSnake[0].setPositionX(blockSnake[0].getPositionY()-1);
    }

    function setDirection(string memory _direction) public {
        direction = _direction;
    }

    function getDirection() public view returns (string memory) {
        return direction;
    }

    function draw() public {
        string memory up = "up";
        string memory left = "left";
        string memory right = "right";
        if (keccak256(bytes(getDirection()))!=keccak256(bytes(left))) {
            drawLeft();
        }else if (keccak256(bytes(getDirection()))!=keccak256(bytes(right))) {
            drawRight();
        }else if (keccak256(bytes(getDirection()))!=keccak256(bytes(up))) {
            drawUp();
        }else{
            drawDown();
        }
        
    }

    function getBlockSnake() public view returns (Block[] memory) {
        return blockSnake;
    }

    function setBlockSnake(Block[] memory _blockSnake) public {
        blockSnake = _blockSnake;
    }

    function addBlock() public {
        Block  b = new Block(getBlockSnake()[getBlockSnake().length-1].getPositionX(),getBlockSnake()[getBlockSnake().length-1].getPositionY());
        draw();
        blockSnake.push(b);
    }

}

