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
    var game : Game?
    var score: Int? = nil
    var name: String? = nil
    var answer = ""
    
    @IBOutlet weak var userAnswer: UITextField!
    @IBOutlet weak var tryAgainLabel: UILabel!
    @IBOutlet weak var toCongrats2: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        game = Game()
        game?.title = name ?? "Error"
        game?.score = score ?? 0
        userAnswer.placeholder = "Enter your answer here"
        tryAgainLabel.isHidden = true
        toCongrats2.isHidden = true
        scoreLabel.text = "Score: \(game?.score ?? 0)"
        titleLabel.text = "\(game?.title ?? "Error")"
        self.userAnswer.delegate = self
    }

    func checkAnswer(answer: String) {
        
        let riddleOutcome = riddle.isSolved(answer: answer)
        
        if riddleOutcome == "try again" {
            game?.wrongAnswer()
            tryAgainLabel.text = "Incorrect"
            tryAgainLabel.isHidden = false
               } else {
            game?.rightAnswer()
            scoreLabel.text = "Score:\(game?.score ?? 0)"
            titleLabel.text = "\(game?.title ?? "Error")"
            tryAgainLabel.text = "Correct!"
            userAnswer.isEnabled = false
            userAnswer.placeholder = "Press Next"
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
        checkAnswer(answer: answer.lowercased())
        return true
    }
}

