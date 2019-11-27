//
//  ChallengeViewTests.swift
//  JackTheRipperTests
//
//  Created by Student on 27/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import XCTest
@testable import JackTheRipper

class ChallengeViewTests: XCTestCase {
    var viewController: UIViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Challenge", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ChallengeViewController")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }



}
