//
//  Challenge5ViewControllerTests.swift
//  JackTheRipperTests
//
//  Created by Student on 02/12/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import XCTest
@testable import JackTheRipper

class Challenge5ViewControllerTests: XCTestCase {


        var viewController : Challenge5ViewController!

        override func setUp() {
            super.setUp()

            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            viewController = (storyboard.instantiateViewController(withIdentifier: "ViewController5") as! Challenge5ViewController)
            UIApplication.shared.keyWindow!.rootViewController = viewController

            let _ = viewController.view
        }

        override func tearDown() {
            super.tearDown()
        }
    
    func test() {
        XCTAssertTrue(true)
    }
    
    func testHasAGuessWho() {
        XCTAssertNotNil(viewController.guessWho)
    }
    
    func testPlayerCanAskAQuestion() {
        let result = viewController.question(input: "Does he have a beard")
        XCTAssertEqual(result, "The suspect did not have a beard.")
    }
    
    func testPlayerCanAskDifferentQuestion() {
        let result = viewController.question(input: "Does he have Glasses?")
        XCTAssertEqual(result, "The suspect did not wear glasses.")
    }
    
  func testPlayerCanAskUnkownQuestion() {
      let result = viewController.question(input: "Does he have a big nose?")
      XCTAssertEqual(result, "The witness isn't sure, try asking them a different question.")
  }
}
