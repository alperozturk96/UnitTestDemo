//
//  XIBBasedVCUITest.swift
//  PcPartsUnitTestDemoTests
//
//  Created by Alper Öztürk on 29.11.2021.

/*
    In this test class we are testing manually created view controller. And its connected to
    XIB.
*/

//

import XCTest
@testable import PcPartsUnitTestDemo

class OverclockGPUVCTests: XCTestCase {

    var sut:OverclockGPUVC!
    
    override func setUpWithError() throws {
        sut = OverclockGPUVC()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    func testOverclockGPUVC_WhenViewControllerLoaded_ReturnTrue(){
        //Assert
        XCTAssertTrue(sut.isViewLoaded)
    }
    
    
    
    
}
