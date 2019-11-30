//
//  RiddleViewController.swift
//  JackTheRipper
//
//  Created by Heli Sivunen on 28/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation
import UIKit

class RiddleViewController: UIViewController, UITextFieldDelegate {
    let riddle = Riddle()
    var answer = ""
    
    @IBOutlet weak var userAnswer: UITextField!
    @IBOutlet weak var tryAgainLabel: UILabel!
    @IBOutlet weak var toCongrats2: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        userAnswer.placeholder = "Enter your answer here"
        tryAgainLabel.isHidden = true
        toCongrats2.isHidden = true

        self.userAnswer.delegate = self
    }

    func checkAnswer(answer: String) {
        
        let riddleOutcome = riddle.isSolved(answer: answer)
        
        if riddleOutcome == "try again" {
            tryAgainLabel.text = "Wrong answer, try again!"
            tryAgainLabel.isHidden = false
               } else {
            tryAgainLabel.text = "right answer"
            tryAgainLabel.isHidden = false
            toCongrats2.isHidden = false
               }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userAnswer.resignFirstResponder()
//        this method resignFirstResponder dismiss the keyboard

//        self.view.endEditing(true) another way of doing resignFirstResponder
        
        answer = userAnswer.text!
        userAnswer.text = ""
        checkAnswer(answer: answer)
        return true
    }
}

