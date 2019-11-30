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
        title = "Junior Detective"
    }
    
    func changeTitle() {
           if score < 6{
               title = "Junior Detective"
           } else if score > 5 && score < 11 {
               title = "Full Detective"
           } else if score > 10 && score < 18 {
            title = "Senior Detective"
           } else if score > 22 {
               title = "Full Detective"
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
        turnScore = 0
        changeTitle()
    }
}
import Foundation
