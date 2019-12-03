//
//  Congratulations1ViewController.swift
//  JackTheRipper
//
//  Created by Heli Sivunen on 03/12/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation
import UIKit

class Congratulations1ViewController: UIViewController {
    
    var score: Int? = nil
    var game : Game?
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game?.score = score ?? 0
        scoreLabel.text = "\(game?.score ?? 0)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let Map2ViewController = segue.destination as? Map2ViewController {
            Map2ViewController.score = game?.score
        }
    }
}
