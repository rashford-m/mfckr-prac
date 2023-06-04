contract Contract {
    uint256 public result;

    function calculate1(uint256 a, uint256 b) public {
        result = a + b;
    }
}

contract Contract2 {
    uint256 public result;

    function calculate2(uint256 a, uint256 b) public {
        result = a * b;
    }
}
