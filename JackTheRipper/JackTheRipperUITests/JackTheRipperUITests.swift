//
//  JackTheRipperUITests.swift
//  JackTheRipperUITests
//
//  Created by Danielle Inkster on 2019-11-26.
//  Copyright © 2019 Team6. All rights reserved.
//

import XCTest

class JackTheRipperUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


// UI Tests use the app’s user-interface controls as a real user would.
// They determine whether the user can complete a specific task using the app.
//   Where UI tests imitate complex workflows comprising multiple distinct steps, use XCTActivity to organize and name the shared steps. Create helper methods to share implementations of activities that are used in multiple tests.
    
    
//    Example test below passes but is NOT compatible with Travis CI
//    func testUIShowsUserScoreChange() {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//        let continueButton = app.buttons["Continue"]
//        let nextButton = app.buttons["Next"]
//        app.buttons["Start Game"].tap()
//        continueButton.tap()
//        nextButton.tap()
//        continueButton.tap()
//        XCTAssertTrue(app.staticTexts["Score: 0"].exists)
//        XCUIApplication().staticTexts["Novice Detective"].tap()
//        app.buttons["LeftHanded"].tap()
//        XCTAssertTrue(app.staticTexts["Score: 5"].exists)
//        XCUIApplication().staticTexts["Junior Detective"].tap()
//        continueButton.tap()
//        continueButton.tap()
//        nextButton.tap()
//        continueButton.tap()
//        let textField =  app.textFields["Enter your answer here"]
//        textField.tap()
//        textField.typeText("leather apron")
//        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.buttons["Continue"].tap()
//        app.staticTexts["Score: 10"].tap()
//        app.staticTexts["Junior Detective"].tap()
//        continueButton.tap()
//        nextButton.tap()
//        continueButton.tap()
//    }

//    func testLaunchPerformance() {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
