// SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volitility coin

pragma solidity ^0.8.18;

/**
 * @title DSCEngine
 * @author Marko Jauregui
 * This system is designed to be as minimal as possible, and have the tokens maintain a 1 token == 1 USD Peg.
 * This StableCoin has the properties:
 * - Exogenous Collateral
 * - Dollar Pegged
 * - Algorithmically Stable
 *
 * It is similar to DAI if DAI had no governance, no fees and was only backed by WETH & WBTC.
 *
 * Our DSC system should always be "Overcollateralized". At no point, should the value of all collateral <= the $ backed value of all the DSC.
 *
 * @notice This contract is the core of the DSC System. It handles all the logic for minting and reedeming DSC. As well as depositing & withdrawing collateral.
 * @notice This contract is loosely based on the MakerDAO DSS (DAI) system.
 */
contract DSCEngine {
    function depositCollateralAndMintDsc() external {}

    function depositCollateral() external {}

    function redeemCollateralForDsc() external {}

    function redeemCollateral() external {}

    function mintDsc() external {}

    function burnDsc() external {}

    function liquidate() external {}

    function getHealthFactor() external view {}
}
