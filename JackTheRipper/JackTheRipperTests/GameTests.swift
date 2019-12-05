//
//  GameTests.swift
//  JackTheRipperTests
//
//  Created by Student on 26/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import XCTest
@testable import JackTheRipper

class GameTests: XCTestCase {
    
    let game = Game()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameScoreStartsAtZero() {
        XCTAssertTrue(game.score == 0)
    }
    
    func testGameProgressStartsAtZero() {
        XCTAssertTrue(game.progress == 0)
    }
    
    func testGameTitleStartsAtJunior() {
        XCTAssertTrue(game.title == "Novice Detective")
    }
    
    
    func testGameLevelsUp() {
        game.score = 7
        game.rightAnswer()
        XCTAssertTrue(game.title == "Detective")
    }
    
    func testRightAnswerIncerementsScore() {
        game.score = 5
        game.rightAnswer()
        XCTAssertTrue(game.score == 10)
    }
    
    func testWrongAnswerDecreasesScoreBeforeRightAnswer() {
          game.score = 5
          game.wrongAnswer()
          game.rightAnswer()
          XCTAssertTrue(game.score == 9)
      }
    
    func testUserGetsAMinimum1PointPerTurn() {
        game.score = 5
        game.wrongAnswer()
        game.wrongAnswer()
        game.wrongAnswer()
        game.wrongAnswer()
        game.wrongAnswer()
        game.rightAnswer()
        XCTAssertTrue(game.score == 6 )
    }
    
    func testGameScoreDoesNotExceed25() {
        game.score = 25
        game.rightAnswer()
        XCTAssertTrue(game.score == 25)
    }
}
