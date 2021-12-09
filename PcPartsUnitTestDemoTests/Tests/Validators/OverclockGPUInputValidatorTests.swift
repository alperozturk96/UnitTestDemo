//
//  OverclockGPUInputValidatorTests.swift
//  PcPartsUnitTestDemoTests
//
//  Created by Alper Öztürk on 29.11.2021.
//


import XCTest
@testable import PcPartsUnitTestDemo

class OverclockGPUInputValidatorTests:XCTestCase {
    
    var sut: OverclockGPUInputValidator!
    
    override func setUpWithError() throws{
        sut = OverclockGPUInputValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testClockSpeedValidation_WhenInvalidClockSpeedProvided_ThrowsAnError(){
        let clockSpeed = "4000"
        XCTAssertThrowsError(try sut.isClockSpeedValid(clockSpeed), "Clock Speed is exceed the limit.") { error in
            XCTAssertEqual(error as? OverlockGPUError, OverlockGPUError.aboveMaxClockSpeed)
        }
    }
    
    func testVoltageValidation_WhenInvalidVoltageProvided_ThrowsAnError(){
        let voltage = "2.0"
        XCTAssertThrowsError(try sut.isVoltageValid(voltage), "Voltage is exceed the limit.") { error in
            XCTAssertEqual(error as? OverlockGPUError, OverlockGPUError.aboveMaxVoltage)
        }
    }
    
    func testVoltageValidation_WhenValidVoltageProvided_ThrowNoError(){
        let voltage = "1.35"
        XCTAssertNoThrow(try sut.isVoltageValid(voltage))
    }
    
    func testClockSpeedValidation_WhenValidClockSpeedProvided_ThrowNoError(){
        let clockSpeed = "1785"
        XCTAssertNoThrow(try sut.isClockSpeedValid(clockSpeed))
    }
    
}
