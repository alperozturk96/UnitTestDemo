//
//  Add.swift
//  PcPartsUnitTestDemoTests
//
//  Created by Alper Öztürk on 27.11.2021.
//

import XCTest
@testable import PcPartsUnitTestDemo

class AddProcessorVCTests: XCTestCase {

    var storyboard:UIStoryboard!
    var sut:AddProcessorVC!
  
    override func setUpWithError() throws {
        continueAfterFailure = false
        storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "addprocessor") as? AddProcessorVC
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
    }

    func testAddProcessorVC_WhenCreated_HasTextfieldsAndRequiredFieldsAreEmpty() throws {
        //Act
        let lithographyTF = try XCTUnwrap(sut.lithographyTF,"lithographyTF is not connected to an IBOutlet")
        let cacheSizeTF = try XCTUnwrap(sut.cacheSizeTF,"cacheSizeTF is not connected to an IBOutlet")
        let clockSpeedTF = try XCTUnwrap(sut.clockSpeedTF,"clockSpeedTF is not connected to an IBOutlet")
        let coreCountTF = try XCTUnwrap(sut.coreCountTF,"coreCountTF is not connected to an IBOutlet")
        let modelNameTF = try XCTUnwrap(sut.modelNameTF,"modelNameTF is not connected to an IBOutlet")
        
        
        //Assert
        XCTAssertEqual(lithographyTF.text, "")
        XCTAssertEqual(cacheSizeTF.text, "")
        XCTAssertEqual(clockSpeedTF.text, "")
        XCTAssertEqual(coreCountTF.text, "")
        XCTAssertEqual(modelNameTF.text, "")
    }
    
    func testAddProcessorVC_WhenCreated_EnsureDefaultManufacturerValue(){
        //Act
        let defaultValue = sut.VM.selectedManufacturer
        let firstValueOfManufacturerPickerView = sut.VM.manufacterers[0]
        
        //Assert
        XCTAssertEqual("INTEL", defaultValue)
        XCTAssertEqual("INTEL", firstValueOfManufacturerPickerView)
    }
    
    func testAddProcessorVC_WhenCreated_HasSaveButton() throws {
        _ = try XCTUnwrap(sut.btnSave,"btnSave is not connected to an IBOutlet")
    }

}
