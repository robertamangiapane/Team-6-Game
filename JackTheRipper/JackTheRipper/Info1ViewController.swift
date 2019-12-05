//
//  Info1ViewController.swift
//  JackTheRipper
//
//  Created by Danielle Inkster on 2019-12-04.
//  Copyright © 2019 Team6. All rights reserved.
//
import Foundation
import UIKit

class Info1ViewController: UIViewController, MultipleChoiceViewControllerDelegate {
  
    var score: Int? = nil
    var turnScore: Int? = nil
    var name: String? = nil
    var game : Game?

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      game = Game()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let MultipleChoiceViewController = segue.destination as? MultipleChoiceViewController {
            MultipleChoiceViewController.score = game?.score;
            MultipleChoiceViewController.turnScore = game?.turnScore;
            MultipleChoiceViewController.name = game?.title;
            MultipleChoiceViewController.delegate = self
        }
    }

    func setScore (score: Int?, name: String?, turnScore: Int?) {
        game?.title = name ?? "Error"
        game?.score = score ?? 0
        game?.turnScore = turnScore ?? 0
       }
}
