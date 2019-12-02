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


        var viewController : ViewController!

        override func setUp() {
            super.setUp()

            let storyboard = UIStoryboard(name: "Challenge5", bundle: Bundle.main)
            viewController = (storyboard.instantiateViewController(withIdentifier: "ViewController5") as! ViewController)
            UIApplication.shared.keyWindow!.rootViewController = viewController

            let _ = viewController.view
        }

        override func tearDown() {
            super.tearDown()
        }
    
    func test() {
        XCTAssertTrue(true)
    }

}
