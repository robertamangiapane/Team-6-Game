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
    var input = ""
    
    @IBOutlet weak var userQuestion: UITextField!
    @IBOutlet weak var ResponseDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResponseDisplay.isHidden = true
        userQuestion.placeholder = "Write your question here..."
        self.userQuestion.delegate = self
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
        let response = unwrappedGuessWho.question(input: input)
        ResponseDisplay.text = response
        ResponseDisplay.isHidden = false
        return response
    }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            userQuestion.resignFirstResponder()
    //        this method resignFirstResponder dismiss the keyboard
    //        self.view.endEditing(true) another way of doing resignFirstResponder
            input = userQuestion.text!
            userQuestion.text = ""
            question(input: input)
            return true
        }
}
