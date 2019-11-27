//
//  IntroViewController.swift
//  JackTheRipper
//
//  Created by Danielle Inkster on 2019-11-27.
//  Copyright © 2019 Team6. All rights reserved.
//

import Foundation
import UIKit

class IntroViewController: UIViewController {
    var game: Game?
    
    //MARK: Properties
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         game = Game()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    
    @IBAction func continueButton(_ sender: Any) {
        }
    }
