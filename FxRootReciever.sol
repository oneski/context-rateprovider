// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

import "./Ownable.sol";


interface IFxMessageProcessor {
    function processMessageFromRoot(
        uint256 stateId,
        address rootMessageSender,
        bytes calldata data
    ) external;
}


contract fxPriceFeed is Ownable {
    address FxChild = 0xCf73231F28B7331BBe3124B907840A94851f9f11; //Mumbai FxChild
    address fxRootSender = 0xe0B11c8c550650F3Cd248EF537341fBb3712E865; //FxRootPriceSender.sol

    modifier onlyFxChild() {
    require(msg.sender == FxChild, 'UNAUTHORIZED_CHILD_ORIGIN');
        _;
    }



    uint256 xChainNumber;


    function processMessageFromRoot(uint256 stateId, address rootMessageSender, bytes calldata data) external onlyFxChild {
        require(rootMessageSender == fxRootSender, 'UNAUTHORIZED_ROOT_ORIGIN');
        xChainNumber = abi.decode(data, (uint256));
    }


    function changeSender(address newSender) public onlyOwner {
        fxRootSender = newSender;
    }
    function retrieve() public view returns (uint256){
        return xChainNumber;
    }
    function getRate() public view returns (uint256){
        return xChainNumber;
    }
    function read_target() public view returns(address){
        return fxRootSender;
    }
}