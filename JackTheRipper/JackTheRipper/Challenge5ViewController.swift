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
    var score: Int? = nil
    var name: String? = nil
    var game : Game?
    var guessWho: GuessWho?
    var input = ""
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var ResponseDisplay: UILabel!
    @IBOutlet weak var Suspect1: UIButton!
    @IBOutlet weak var CorrectButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var Suspect2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
        game?.title = name ?? "Error"
        game?.score = score ?? 0
        scoreLabel.text = "Score: \(game?.score ?? 0)"
        titleLabel.text = "\(game?.title ?? "Error")"
        CorrectButton.isHidden = true
        userInput.placeholder = "Ask the witness a question!"
        self.userInput.delegate = self
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
        return response
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            input = userInput.text!
            userInput.text = ""
            ResponseDisplay.text = question(input: input)
        return true
    }
    
    @IBAction func SuspectButtons(_ sender: UIButton) {
        if sender == Suspect1 {
            self.navigationItem.hidesBackButton = true
            ResponseDisplay.text = "That's him!"
            CorrectButton.isHidden = false
            Suspect1.isEnabled = false
            game?.rightAnswer()
            scoreLabel.text = "Score: \(game?.score ?? 0)"
            titleLabel.text = "\(game?.title ?? "Error")"
        } else {
            ResponseDisplay.text = "No, that's not the guy."
            game?.wrongAnswer()
            sender.setImage(UIImage(named: "redCross.png"), for: .normal)
            sender.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let Congrats5ViewController = segue.destination as? Congrats5ViewController {
            Congrats5ViewController.score = game?.score;
            Congrats5ViewController.name = game?.title
        }
    }
}
