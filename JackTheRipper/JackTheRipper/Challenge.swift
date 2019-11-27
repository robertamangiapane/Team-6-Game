//
//  Challenge.swift
//  JackTheRipper
//
//  Created by Student on 27/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation

class Challenge {
    func isSolved(answer: String) -> String {
        if answer == "yes" {
            return "correct"
        } else {
            return "incorrect"
        }
    }
}
