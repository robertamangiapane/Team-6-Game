//
//  MultipleChoiceViewController.swift
//  JackTheRipper
//
//  Created by Danielle Inkster on 2019-12-02.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation
import UIKit

class MultipleChoiceViewController: UIViewController {
    let game = Game()
    let correctAnswer = 0
    
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
       override func viewDidLoad(){
        super.viewDidLoad()
        nextButton.isHidden = true
    }

    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct"
            game.rightAnswer()
            scoreLable.text = "Score: \(game.score)"
            nextButton.isHidden = false
        } else {
            title = "Incorrect"
            game.wrongAnswer()
        }
    }
    
    
}
