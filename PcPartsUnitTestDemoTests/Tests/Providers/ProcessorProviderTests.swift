//
//  ProcessorsVCTests.swift
//  PcPartsUnitTestDemoTests
//
//  Created by Alper Öztürk on 24.11.2021.
//

import XCTest
import CoreData
@testable import PcPartsUnitTestDemo

class ProcessorProviderTests:XCTestCase {
    
    var sut: ProcessorProvider!

    override func setUp() {
        let context = CoreDataTestStack().mainContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Processors")
        sut = ProcessorProvider(context: context, request: request)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testProcessorList_WhenNoProcessorExistInDBAndCreateEmptyProcessorList_ShouldReturnNotNil(){
        //Act
        let processorList = sut.fetchRequest()
        
        //Assert
        XCTAssertNotNil(processorList)
    }
    
    func testProcessorList_WhenNoProcessorExistInDB_ShouldReturnEqualZero(){
        //Act
        let processorList = sut.fetchRequest()
        
        //Assert
        XCTAssertEqual(processorList.count, 0)
    }
    
}
