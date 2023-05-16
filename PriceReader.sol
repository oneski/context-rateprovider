// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

interface sfrxETHCtr {
    function pricePerShare() external view returns (uint256);
}


contract priceReader {
    address private sfrxETH = 0x9571B72000234f886f202034225fd4eee3E829fF;

    uint256 number;

    /**
     * @dev Store value in variable
     */
    function get_store() public {
        uint256 new_num = sfrxETHCtr(sfrxETH).pricePerShare();
        number = new_num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
    function ppS() public view returns (uint256){
        return sfrxETHCtr(sfrxETH).pricePerShare();
    }
}