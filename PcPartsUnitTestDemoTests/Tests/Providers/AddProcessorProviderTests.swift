//
//  ProcessMTests.swift
//  PcPartsUnitTestDemoTests
//
//  Created by Alper Öztürk on 23.11.2021.
//

import XCTest
import CoreData
@testable import PcPartsUnitTestDemo

class AddProcessorProviderTests:XCTestCase {
    
    var sut: AddProcessorProvider!
    
    override func setUpWithError() throws{
        let context = CoreDataTestStack().mainContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Processors", in: context) else {
            XCTFail()
            return
        }
        sut = AddProcessorProvider(context: context, entity: entity)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testCreateProcessor_WhenProcessorExistAndSuccesfullyCreated_ShouldReturnTrue() throws{
        //Act
        guard let sut = sut else {
            XCTFail()
            return
        }
        
        let processor = ProcessorM(entity: sut.entity,
                                   insertInto: sut.context)
        processor.manufacturer = "AMD"
        processor.modelName =  "Phenom II X6 1100T"
        processor.coreCount = NumberFormatter().number(from: "6")
        processor.cacheSize = NumberFormatter().number(from: "12")
        processor.lithography = NumberFormatter().number(from: "45")
        processor.clockSpeed = NumberFormatter().number(from: "3500")
        
        guard let modelName = sut.save(processor: processor) else {
            return XCTFail()
        }
        
        //Assert
        XCTAssertEqual(modelName, "Phenom II X6 1100T")
    }
}
