//
//  Challenge5ViewController.swift
//  JackTheRipper
//
//  Created by Student on 02/12/2019.
//  Copyright © 2019 Team6. All rights reserved.
//
import Foundation
import UIKit

class Challenge5ViewController: UIViewController, UITextFieldDelegate {
    
//    var response: String?
    var guessWho: GuessWho?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessWho = GuessWho()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func question(input: String) -> String {
        guard let unwrappedGuessWho = guessWho else {
            print("GuessWho is nil!")
            return "GuessWho is nil!"
        }
        let response = unwrappedGuessWho.question(input: "Did the suspect have a beard")
        return response
    }
    
}
