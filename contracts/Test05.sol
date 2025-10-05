// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title MergeSortedArray
 * @dev 合并两个有序数组的工具合约
 */
contract Test05 {
    
    /**
     * @dev 合并两个升序数组（标准双指针方法）
     * @param nums1 第一个升序数组
     * @param nums2 第二个升序数组
     * @return 合并后的升序数组
     */
    function mergeSortedArrays(
        uint256[] memory nums1,
        uint256[] memory nums2
    ) public pure returns (uint256[] memory) {
        uint256 m = nums1.length;
        uint256 n = nums2.length;
        uint256 totalLength = m + n;
        
        uint256[] memory result = new uint256[](totalLength);
        uint256 i = 0; // nums1 指针
        uint256 j = 0; // nums2 指针
        uint256 k = 0; // result 指针
        
        // 双指针合并核心逻辑
        while (i < m && j < n) {
            if (nums1[i] <= nums2[j]) {
                result[k] = nums1[i];
                i++;
            } else {
                result[k] = nums2[j];
                j++;
            }
            k++;
        }
        
        // 复制 nums1 剩余元素
        while (i < m) {
            result[k] = nums1[i];
            i++;
            k++;
        }
        
        // 复制 nums2 剩余元素
        while (j < n) {
            result[k] = nums2[j];
            j++;
            k++;
        }
        
        return result;
    }
}