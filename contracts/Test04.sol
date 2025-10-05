// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IntegerToRomanConverter
 * @dev 将整数转换为罗马数字的工具合约
 */
contract IntegerToRomanConverter {
    
    // 定义数值到罗马数字的映射数组
    uint256[] private values;
    string[] private symbols;
    
    /**
     * @dev 构造函数，初始化映射
     */
    constructor() {
        _initializeMappings();
    }
    
    /**
     * @dev 内部函数：初始化数值和罗马数字的对应关系
     * 按从大到小的顺序排列，便于贪心算法
     */
    function _initializeMappings() private {
        values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
        symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
    }
    
    /**
     * @dev 将整数转换为罗马数字
     * @param num 要转换的整数 (1-3999)
     * @return 罗马数字字符串
     */
    function intToRoman(uint256 num) public view returns (string memory) {
        require(num >= 1 && num <= 3999, "Number must be between 1 and 3999");
        
        uint256 temp = num;
        bytes memory result;
        
        // 使用贪心算法，从最大的数值开始匹配
        for (uint256 i = 0; i < values.length; i++) {
            while (temp >= values[i]) {
                result = abi.encodePacked(result, symbols[i]);
                temp -= values[i];
            }
        }
        
        return string(result);
    }
}