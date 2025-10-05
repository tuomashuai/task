// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title BinarySearch
 * @dev 在有序数组中执行二分查找的工具合约
 */
contract Test06 {
    
    /**
     * @dev 标准二分查找 - 查找目标值的索引
     * @param arr 升序排列的数组
     * @param target 目标值
     * @return 目标值的索引，如果不存在则返回 type(uint256).max
     */
    function binarySearch(
        uint256[] memory arr,
        uint256 target
    ) public pure returns (uint256) {
        uint256 left = 0;
        uint256 right = arr.length;
        
        // 使用 [left, right) 区间
        while (left < right) {
            uint256 mid = left + (right - left) / 2;
            
            if (arr[mid] == target) {
                return mid;
            } else if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
 
        return type(uint256).max; // 表示未找到
    }   }