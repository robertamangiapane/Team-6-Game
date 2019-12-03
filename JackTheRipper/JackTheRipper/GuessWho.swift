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
        let hasABeard = words.contains("beard")
        let hasAMustache = words.contains("mustache") || words.contains("moustache")  || words.contains("facial")
        let hasGlasses = words.contains("glasses") || words.contains("spectacles")
        let hasHair = words.contains("hair") || words.contains("bald") || words.contains("balding")
        
        if hasABeard {
            return "The suspect did not have a beard."
        } else if hasAMustache {
            return "The suspect had a mustache."
        } else if hasGlasses {
            return "The suspect did not wear glasses."
        } else if hasHair {
            return "The suspect had short hair."
        } else {
            return "The witness isn't sure, try asking them a different question."
        }
    }
}
