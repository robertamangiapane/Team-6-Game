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
        let words = input.lowercased().split{ !$0.isLetter }
        return questionResponse(words: words)
    }

    private func questionResponse(words: [String.SubSequence]) -> String {
        var response = "The witness isn't sure, try asking them a different question."
        for word in words {
            switch word {
                case "beard":
                    response = "The suspect did not have a beard."
                case "mustache", "moustache":
                    response = "The suspect had a mustache."
                case "glasses", "spectacles":
                    response = "The suspect did not wear glasses."
                case "hair", "bald", "balding":
                    response = "The suspect had short hair."
                default: ()
            }
        }
        let facialHair = words.contains("facial") && words.contains("hair")
        if facialHair { response = "The suspect had a mustache." }
        return response
    }
}


