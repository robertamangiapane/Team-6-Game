//
//  Game.swift
//  JackTheRipper
//
//  Created by Student on 26/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

class Game{
    var score: Int
    var progress: Int
    var title: String
    var scoreMax: Int

    
    init(){
       score = 0
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
    
    func play () {
        if score <= 20 {
        score += 5
        } else {
        score = scoreMax
        }
        changeTitle()
        
    }
}
import Foundation
