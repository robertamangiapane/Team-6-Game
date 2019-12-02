//
//  ViewControllerTests.swift
//  JackTheRipperTests
//
//  Created by Danielle Inkster on 2019-11-27.
//  Copyright © 2019 Team6. All rights reserved.
//

import XCTest
@testable import JackTheRipper

    class ViewControllerTests: XCTestCase {

        var viewController : ViewController!

        override func setUp() {
            super.setUp()

            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            viewController = (storyboard.instantiateViewController(withIdentifier: "TitleController") as! ViewController)
            UIApplication.shared.keyWindow!.rootViewController = viewController

            let _ = viewController.view
        }

        override func tearDown() {
            super.tearDown()
        }
    

        func testStartButtonCreatesANewGame() {
            XCTAssertNotNil(viewController.startGameButton)
        }

    }
