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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tryAgainLabel.isHidden = true

        self.userAnswer.delegate = self
    }

    func checkAnswer(answer: String) {
        
        let riddleOutcome = riddle.isSolved(answer: answer)
        
        if riddleOutcome == "try again" {
            riddle.game.wrongAnswer()
            tryAgainLabel.text = "Wrong answer, try again!"
            tryAgainLabel.isHidden = false
               } else {
            riddle.game.rightAnswer()
            tryAgainLabel.text = "right answer"
            scoreLabel.text = "Score: \(riddle.game.score)"
            titleLabel.text = "\(riddle.game.title)"
            tryAgainLabel.isHidden = false
//            insert the link to next page here
               }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userAnswer.resignFirstResponder()
//        this method resignFirstResponder dismiss the keyboard

//        self.view.endEditing(true) another way of doing resignFirstResponder
        
        answer = userAnswer.text!
        checkAnswer(answer: answer)
        return true
    }
}

