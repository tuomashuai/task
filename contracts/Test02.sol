// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;


contract Test02{

    function ReverseString(string memory _str) public returns(string memory){

        // 将字符串转换为 bytes 进行操作
        bytes memory strBytes = bytes(_str);
        bytes memory reversed = new bytes(strBytes.length);

        for (uint i = 0; i < strBytes.length; i++) {
            reversed[i] = strBytes[strBytes.length - 1 - i];
        }
        return string(reversed);
    }


}