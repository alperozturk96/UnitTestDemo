//
//  PcPartsUnitTestDemoUITests.swift
//  PcPartsUnitTestDemoUITests
//
//  Created by Alper Öztürk on 29.11.2021.
//

import XCTest

class HomeVCUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
      
    }

    func testMenuTableView_WhenSelectRow_OpenRelatedPages() throws {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Processor List"].tap()
        app.navigationBars["PcPartsUnitTestDemo.ProcessorsVC"].buttons["PcParts"].tap()
        tablesQuery.staticTexts["Add New Processor"].tap()
        app.navigationBars["PcPartsUnitTestDemo.AddProcessorVC"].buttons["PcParts"].tap()
        tablesQuery.staticTexts["Cat Facts :)"].tap()
        app.navigationBars["PcPartsUnitTestDemo.CatFactsVC"].buttons["PcParts"].tap()
        tablesQuery.staticTexts["Overclock GPU !"].tap()
        app.navigationBars["PcPartsUnitTestDemo.OverclockGPUVC"].buttons["PcParts"].tap()
    }

   
}
