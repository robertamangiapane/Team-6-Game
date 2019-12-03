//
//  Riddle.swift
//  JackTheRipper
//
//  Created by Heli Sivunen on 28/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation

class Riddle {
    var correctAnswer = "correct"
    let game = Game()
    
    func isSolved(answer: String) -> String {
        if answer == correctAnswer {
            return "new location"
        } else {
            return "try again"
        }
    }
}
