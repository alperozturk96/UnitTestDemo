//
//  PcPartsUnitTestDemoTests.swift
//  PcPartsUnitTestDemoTests
//
//  Created by Alper Öztürk on 21.11.2021.
//

import XCTest
import CoreData
@testable import PcPartsUnitTestDemo

class AddProcessorInputValidatorTests: XCTestCase {
    
    var context: NSManagedObjectContext!
    var entity: NSEntityDescription!
    var sut: AddProcessorInputValidator!

    override func setUp() {
        context = CoreDataTestStack().mainContext
        entity = NSEntityDescription.entity(forEntityName: "Processors", in: context)
        sut = AddProcessorInputValidator()
    }
    
    override func tearDown() {
        context = nil
        entity = nil
        sut = nil
    }
    
    func testCheckInput_WhenAllInputNil_ShouldReturnFalse(){
        //Act
        let processor = ProcessorM(entity: entity, insertInto: context)
        processor.manufacturer = nil
        processor.modelName =  nil
        processor.coreCount = nil
        processor.cacheSize = nil
        processor.lithography = nil
        processor.clockSpeed = nil
        
        let isProcessorValid = sut.checkInput(processor: processor)
        
        //Assert
        XCTAssertFalse(isProcessorValid)
    }
    
    func testCheckInput_WhenAllInputEmpty_ShouldReturnFalse(){
        //Act
        let processor = ProcessorM(entity: entity, insertInto: context)
        processor.manufacturer = ""
        processor.modelName =  ""
        processor.coreCount = NumberFormatter().number(from: "")
        processor.cacheSize = NumberFormatter().number(from: "")
        processor.lithography = NumberFormatter().number(from: "")
        processor.clockSpeed = NumberFormatter().number(from: "")
        
        let isProcessorValid = sut.checkInput(processor: processor)
        
        //Assert
        XCTAssertFalse(isProcessorValid)
    }
    
    func testCheckInput_WhenAllInputProvided_ShouldReturnTrue(){
        //Act
        let processor = ProcessorM(entity: entity, insertInto: context)
        processor.manufacturer = "Apple"
        processor.modelName =  "M1 Pro"
        processor.coreCount = NumberFormatter().number(from: "10")
        processor.cacheSize = NumberFormatter().number(from: "32")
        processor.lithography = NumberFormatter().number(from: "5")
        processor.clockSpeed = NumberFormatter().number(from: "4100")
        
        let isProcessorValid = sut.checkInput(processor: processor)
        
        //Assert
        XCTAssertTrue(isProcessorValid)
    }

}
