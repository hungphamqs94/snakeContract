pragma solidity >=0.5.0 <0.9.0;

contract Player {
    string name;
    uint16 score;
    constructor(string memory _name) public {
        name = _name;
        score = 0;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function setScore(uint16 _score) public {
        score = _score;
    }

    function getScore() public view returns (uint16) {
        return score;
    }

}