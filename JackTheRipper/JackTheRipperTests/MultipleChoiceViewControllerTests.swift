//
//  MultipleChoiceViewControllerTests.swift
//  JackTheRipperTests
//
//  Created by Danielle Inkster on 2019-12-03.
//  Copyright © 2019 Team6. All rights reserved.
//

import XCTest
@testable import JackTheRipper

class MultipleChoiceViewControllerTests: XCTestCase {
    var MCViewController : MultipleChoiceViewController!

    override func setUp() {
                super.setUp()

            let storyboard = UIStoryboard(name: "MultipleChoice", bundle: Bundle.main)
            MCViewController = (storyboard.instantiateViewController(withIdentifier: "MultipleChoiceViewController") as! MultipleChoiceViewController)
            UIApplication.shared.keyWindow!.rootViewController = MCViewController

            let _ = MCViewController.view
        }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThereIsANextButton() {
        XCTAssertNotNil(MCViewController.nextButton)
           }
    
    func testThereIsARightAnswerButton() {
          XCTAssertNotNil(MCViewController.rightAnswer)
             }
    
    func testThereIsWrongAnswerButtons() {
    XCTAssertNotNil(MCViewController.wrongAnswer1)
       }
}



