pragma solidity ^0.8.28;


contract Test03{

    mapping (bytes1 => uint256) public romanToValue;

    uint256[] mappingValue;

    uint256 sum;

    constructor(){
        _initializeMapping();
    }


    function romanToInt(string memory roman) public returns(uint256){
        bytes memory romanByte =  bytes(roman);

        require(romanByte.length > 0,"param not null");

        for(uint i = 0; i< romanByte.length; i++){
            mappingValue.push(romanToValue[romanByte[i]]);
       }

        for(uint i=0;i<mappingValue.length;i++){
            sum += mappingValue[i];
       } 

        return sum;

    }


    /**
     * @dev 内部函数：初始化映射
     */
    function _initializeMapping() private {
        romanToValue['I'] = 1;
        romanToValue['V'] = 5;
        romanToValue['X'] = 10;
        romanToValue['L'] = 50;
        romanToValue['C'] = 100;
        romanToValue['D'] = 500;
        romanToValue['M'] = 1000;
    }
}