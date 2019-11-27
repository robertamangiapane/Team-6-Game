//
//  Challenge.swift
//  JackTheRipper
//
//  Created by Student on 27/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation

class Challenge {
    
    let correct_answer = "yes"
    
    func isSolved(answer: String) -> String {
        if answer == correct_answer {
            return "new location"
        } else {
            return "try again"
        }
    }
}
