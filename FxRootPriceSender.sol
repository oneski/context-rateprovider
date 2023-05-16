// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

 import "./Ownable.sol";

interface sfrxETHCtr {
    function pricePerShare() external view returns (uint256);
}

interface IFxStateSender {
    function sendMessageToChild(address _receiver, bytes calldata _data) external;
}

contract fxPriceReader is Ownable {
    address private sfrxETH = 0x9571B72000234f886f202034225fd4eee3E829fF; //DS Goerli sfrxETH
    address private FxRoot = 0x3d1d3E34f7fB6D26245E6640E1c50710eFFf15bA; //Goerli FxRoot

    uint256 number;
    address target;

    /**
     * @dev Store value in variable
     */

    function set_target(address tar) public onlyOwner {
        target = tar;
    }
    function get_store() public {
        uint256 new_num = sfrxETHCtr(sfrxETH).pricePerShare();
        number = new_num;
    }

    function send_store() public {
        uint256 new_num = sfrxETHCtr(sfrxETH).pricePerShare();
        number = new_num;
        IFxStateSender(FxRoot).sendMessageToChild(target, abi.encode(new_num));
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
    function read_target() public view returns(address){
        return target;
    }
}