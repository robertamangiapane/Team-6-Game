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
    
    var guessWho: GuessWho?
    
    @IBOutlet weak var userQuestion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userQuestion.placeholder = "Write your question here..."
        
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
        var response = unwrappedGuessWho.question(input: input)
        return response
    }
    
}
