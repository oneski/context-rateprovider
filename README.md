# context-rateprovider
Bridge RateProvider Info Using FxPortal

NOTE: NOT AUDITED, NOT WELL WRITTEN, DO NOT USE IN PRODUCTION

A series of contracts that allow anyone to permissionlessly pass ContractContext in this case, sfrxETH's pricePerShare, from Ethereum to another chain using the FxPortal Messaging Bridge.

sfrxETH.sol - Mock of sfrxETH, exposes a stored number, uint256, publically editable via store(), via pricePerShare() which matches the normal sfrxETH pricePerShare() 

FxRootPriceSender.sol - Allows anyone via send_store() function to get the pricePerShare() value from sfrxETH.sol and send to FxRootPriceReciever over FxPortal (via FxRoot)

FxRootReciever.sol - Recieves pricePerShare() value from FxChild, validates it came from FxRootPriceSender and updates internal value. Exposes sfrxETH pricePerShare() via getRate()
