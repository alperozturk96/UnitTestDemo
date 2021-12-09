//
//  NavigationControllerTests.swift
//  PcPartsUnitTestDemoTests
//
//  Created by Alper Öztürk on 29.11.2021.

/*
    We are testing all possible navigation from home screen.
*/
//

import XCTest
@testable import PcPartsUnitTestDemo

class NavigationControllerTests: XCTestCase {

    var sut: HomeVC!
    var navController: UINavigationController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        sut.loadViewIfNeeded()
        navController = UINavigationController.init(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
        navController = nil
    }
    
    func testHomeVC_WhenLoadedAndPerformSegue_IsProcessorVCPushed(){
        let predicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is ProcessorsVC
        }
        
        expectation(for: predicate, evaluatedWith: navController)
        
        sut.performSegue(withIdentifier: "showProcessorsVC", sender: nil)
        
        waitForExpectations(timeout: 1.5)
    }
    
    func testHomeVC_WhenLoadedAndPerformSegue_IsAddProcessorVCPushed(){
        let predicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is AddProcessorVC
        }
        
        expectation(for: predicate, evaluatedWith: navController)
        
        sut.performSegue(withIdentifier: "showAddProcessorVC", sender: nil)
        
        waitForExpectations(timeout: 1.5)
    }
    
    
    func testHomeVC_WhenLoadedAndPerformSegue_IsCatFactsVCPushed(){
        let predicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is CatFactsVC
        }
        
        expectation(for: predicate, evaluatedWith: navController)
        
        sut.performSegue(withIdentifier: "showCatFactsVC", sender: nil)
        
        waitForExpectations(timeout: 1.5)
    }
    
    func testHomeVC_WhenLoadedAndPushNavControlelr_IsOverclockGPUVCPushed(){
        let predicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is OverclockGPUVC
        }
        
        expectation(for: predicate, evaluatedWith: navController)
        
        sut.openOverclockGPUVC()
        
        waitForExpectations(timeout: 1.5)
    }

    
    
}
