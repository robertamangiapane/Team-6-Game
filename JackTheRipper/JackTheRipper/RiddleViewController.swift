//
//  RiddleViewController.swift
//  JackTheRipper
//
//  Created by Heli Sivunen on 28/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation
import UIKit

class RiddleViewController: UIViewController {
    let riddle = Riddle()
    @IBOutlet weak var userAnswer: UITextField!
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    func checkAnswer(answer: String) -> String {
        return riddle.isSolved(answer: answer)
    }
}
//extension RiddleViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
////        checkAnswer(answer: userAnswer)
//        return true
//    }
//}
