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
    
    override func viewDidLoad(){
        super.viewDidLoad()

        self.userAnswer.delegate = self
    }

    func checkAnswer(answer: String) -> String {
        return riddle.isSolved(answer: answer)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userAnswer.resignFirstResponder()
//        this method resignFirstResponder dismiss the keyboard

//        self.view.endEditing(true) another way of doing resignFirstResponder
        
        answer = (userAnswer.text!)
        print(checkAnswer(answer: answer))
        return true
    }
    
}

