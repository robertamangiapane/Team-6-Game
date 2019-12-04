//
//  Game.swift
//  JackTheRipper
//
//  Created by Student on 26/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

class Game{
    var turnScore: Int
    var score: Int
    var progress: Int
    var title: String
    var scoreMax: Int
    var turnMin: Int

    
    init(){
       score = 0
        turnScore = 5
        turnMin = 1
        scoreMax = 25
        progress = 0
        title = "Novice Detective"
    }
    
    func changeTitle() {
        switch score {
        case ...3:
            title = "Novice Detective"
        case 4...8:
            title = "Junior Detective"
        case 9...12:
            title = "Detective"
        case 13...19:
            title = "Senior Detective"
        case 20...:
            title = "Master Detective"
        default:
            title = "Error"
        }
    }
    
    func wrongAnswer() {
        if turnScore == turnMin {
            turnScore = turnMin
         } else {
            turnScore = turnScore - 1
         }
     }
        
    func addToGameScore(){
        if score <= (25 - turnScore) {
            score += turnScore
        } else {
            score = scoreMax
        }
    }
     
     func rightAnswer() {
        addToGameScore()
        turnScore = 5
        changeTitle()
    }
}
import Foundation
