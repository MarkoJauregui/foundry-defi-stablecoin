// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/ERC20Mock.sol";

contract DSCEngineTest is Test {
    DeployDSC deployer;
    DecentralizedStableCoin dsc;
    DSCEngine engine;
    HelperConfig config;
    address ethUsdPriceFeed;
    address weth;

    address public USER = makeAddr("user");
    uint256 public constant COLLATERAL_AMOUNT = 10 ether;
    uint256 public constant STARTING_ERC20_BALANCE = 20 ether;

    function setUp() public {
        deployer = new DeployDSC();
        (dsc, engine, config) = deployer.run();
        (ethUsdPriceFeed,, weth,,) = config.activeNetworkConfig();
        ERC20Mock(weth).mint(USER, STARTING_ERC20_BALANCE);
    }

    ////////////////////
    // Price Tests /////
    ////////////////////

    function testGetUsdValue() public {
        uint256 ethAmount = 15e18; //15 ETH
        // 15e18 * 2000/ETH = 30,000e18
        uint256 expectedUsd = 30000e18;
        uint256 actualUsd = engine.getUsdValue(weth, ethAmount);
        assertEq(expectedUsd, actualUsd);
    }

    ////////////////////////////////
    // depositCollateral Tests /////
    ////////////////////////////////

    function testRevertsIfCollateralZero() public {
        vm.startPrank(USER);
        ERC20Mock(weth).approve(address(engine), COLLATERAL_AMOUNT);
        vm.expectRevert(DSCEngine.DSCEngine__NeedsMoreThanZero.selector);
        engine.depositCollateral(weth, 0);
        vm.stopPrank();
    }
}
