//
//  Game.swift
//  JackTheRipper
//
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
         if score < 5 {
            title = "Novice Detective"
        } else if score >= 5  && score < 11{
            title = "Junior Detective"
        } else if score >= 11 && score < 17 {
            title = "Detective"
        } else if score >= 17 && score < 22 {
            title = "Senior Detective"
        } else if score >= 22 {
            title = "Master Detective"
            }
        }
    
    func wrongAnswer() {
        if turnScore == turnMin {
            turnScore = turnMin
         } else {
            turnScore -= 1
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
