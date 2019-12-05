//
//  Info2ViewController.swift
//  JackTheRipper
//
//  Created by Danielle Inkster on 2019-12-03.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation
import UIKit

class Info2ViewController: UIViewController, RiddleViewControllerDelegate {
    
    var score: Int? = nil
    var name: String? = nil
    var turnScore: Int? = nil
    var game : Game?
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            game = Game()
            game?.title = name ?? "Novice Detective"
            game?.score = score ?? 0
            scoreLabel.text = "Score: \(game?.score ?? 0)"
            titleLabel.text = "\(game?.title ?? "Novice Detective")"
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let RiddleViewController = segue.destination as? RiddleViewController {
            RiddleViewController.turnScore = game?.turnScore;
            RiddleViewController.score = game?.score;
            RiddleViewController.name = game?.title
            RiddleViewController.delegate = self
            }
        }
    
    func setScore (turnScore: Int?) {
        game?.turnScore = turnScore ?? 0
     
    }
}
