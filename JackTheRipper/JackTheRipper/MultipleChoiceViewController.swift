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
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        game.rightAnswer()
    }
}
