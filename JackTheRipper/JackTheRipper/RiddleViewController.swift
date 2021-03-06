//
//  RiddleViewController.swift
//  JackTheRipper
//
//  Created by Heli Sivunen on 28/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation
import UIKit

protocol RiddleViewControllerDelegate : class  {
    func setScore (turnScore:Int?)
}

class RiddleViewController: UIViewController, UITextFieldDelegate {
    weak var delegate : RiddleViewControllerDelegate?
    let riddle = Riddle()
    var game : Game?
    var name : String? = nil
    var score : Int? = nil
    var turnScore: Int? = nil
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
        game?.turnScore = turnScore ?? 5
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
            delegate?.setScore(turnScore: game?.turnScore)
               } else {
            self.navigationItem.hidesBackButton = true
            game?.rightAnswer()
            scoreLabel.text = "Score:\(game?.score ?? 0)"
            titleLabel.text = "\(game?.title ?? "Error")"
            tryAgainLabel.text = "Correct!"
            userAnswer.isEnabled = false
            userAnswer.placeholder = "Press Next"
            tryAgainLabel.isHidden = false
            toCongrats2.isHidden = false
            delegate?.setScore(turnScore: game?.turnScore)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let Congrats2ViewController = segue.destination as? Congrats2ViewController {
             Congrats2ViewController.score = game?.score;
             Congrats2ViewController.name = game?.title
         }
     }
}

