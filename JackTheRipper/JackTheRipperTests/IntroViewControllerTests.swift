//
//  IntroViewControllerTests.swift
//  JackTheRipperTests
//
//  Created by Danielle Inkster on 2019-11-27.
//  Copyright © 2019 Team6. All rights reserved.
//

import XCTest
@testable import JackTheRipper

class IntroViewControllerTests: XCTestCase {
        var introViewController : IntroViewController!

        override func setUp() {
            super.setUp()

            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            introViewController = (storyboard.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController)
            UIApplication.shared.keyWindow!.rootViewController = introViewController

            let _ = introViewController.view
        }

        override func tearDown() {
            super.tearDown()
        }
    
        func testContinueButtonIsThere() {
            XCTAssertNotNil(introViewController.continueButton)
        }
        
        func testThereIsANewGame() {
            XCTAssertNotNil(introViewController.game)
               }

    }
