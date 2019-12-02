//
//  GuessWho.swift
//  JackTheRipper
//
//  Created by Student on 02/12/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation

class GuessWho {
    
    func question(input: String) -> String {
        var words = input.lowercased().split{ !$0.isLetter }
        var hasABeard = words.contains("beard")
        if hasABeard {
            return "The suspect did not have a beard."
        } else {
            return "The witness isn't sure, try asking them a different question."
        }
    }
}
