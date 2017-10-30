//
//  ViewController.swift
//  3CardMontyV2
//
//  Created by Lisa J on 10/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func button1(_ sender: UIButton) {
        result.text = "You Lose!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
}

