//
//  CatFactsTests.swift
//  PcPartsUnitTestDemoTests
//
//  Created by Alper Öztürk on 24.11.2021.
//

/*
 
    Arrange -> Arrange steps should set up the test case.
    Act -> Target behavior. Act steps should cover the main thing to be tested.
    Assert -> It represent expected outcomes.
 
    Combine Unit Test with MockURLProtocol and ResultWrapper.
 
*/

import XCTest
import Combine
@testable import PcPartsUnitTestDemo

class CatFactsVCTests:XCTestCase {

    var catFactAnyCancellable:AnyCancellable?
    var resultWrapper:MockResultWrapper!
    var sut:CatFactsVM!
    
    override func setUp() {
        resultWrapper = MockResultWrapper()
        sut = CatFactsVM()
    }
    
    override func tearDown() {
        sut = nil
        resultWrapper = nil
        catFactAnyCancellable = nil
    }
    
    func testFetchCatFact_WhenGivenURLIsEmpty_ShouldReturnTrue(){
        //Act
        if resultWrapper.mockPublisher(url: "") == nil {
            //Assert
            XCTAssertTrue(true)
        }
        else
        {
           XCTFail()
        }
    }
    
    func testFetchCatFact_WhenReceivedDifferentJSONResponse_ShouldReturnError(){
        //Arrange
        MockURLProtocol.stubResponseHandler = { request in
            return (HTTPURLResponse(), Data())
        }
        
        guard let publisher = resultWrapper.mockPublisher(url: "https://catfact.ninja/fact") else {
            XCTFail()
            return
        }
        
        let expectation = self.expectation(description: "Error Response Expectation")
        
        //Act
        catFactAnyCancellable = sut.fetchCatFact(publisher: publisher, complicated: { catFact in
            XCTFail()
        }, error: { error in
            //Assert
            XCTAssertNotNil(error)
            expectation.fulfill()
        })
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testFetchCatFact_WhenGivenSuccesfullResponse_ShouldReturnEqual(){
        //Arrange
        let fact = CatFactsM(fact: "The average litte rof kittens is between 2-6 kittens.", length: 60)
        var mockData:Data!
        
        do
        {
            mockData = try JSONEncoder().encode(fact)
        }
        catch
        {
            XCTFail()
        }
        
        //Insert MockData
        MockURLProtocol.stubResponseHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        guard let publisher = resultWrapper.mockPublisher(url: "https://catfact.ninja/fact") else {
            XCTFail()
            return
        }
        
        let expectation = self.expectation(description: "Succesfull Response Expectation")
        
        //Act
        catFactAnyCancellable = sut.fetchCatFact(publisher: publisher, complicated: { catFact in
            //Assert
            XCTAssertEqual(catFact.length, 60)
            expectation.fulfill()
        }, error: { error in
            XCTFail()
        })
        
        self.wait(for: [expectation], timeout: 5)
    }
    
}
