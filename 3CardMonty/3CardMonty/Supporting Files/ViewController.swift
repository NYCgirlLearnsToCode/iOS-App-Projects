//
//  ViewController.swift
//  3CardMonty
//
//  Created by Lisa J on 10/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var kingButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kingButton.setImage(#imageLiteral(resourceName: "cardbackred_720"), for: .normal)
        backButton.setImage(#imageLiteral(resourceName: "cardbackred_720"), for: .normal)
        threeButton.setImage(#imageLiteral(resourceName: "cardbackred_720"), for: .normal)
        resetButton.isHidden = true
//        result.isHidden = true
        result.text = "Let's Play!"
        
    }
    
    @IBAction func king(_ sender: UIButton) {
        
        kingButton.setImage(#imageLiteral(resourceName: "kingcard_360"), for: .normal)
        result.isHidden = false
        result.text = "You win"
        backButton.isEnabled = false
        threeButton.isEnabled = false
        resetButton.isHidden = false
    }
    
    @IBAction func three(_ sender: UIButton) {
        threeButton.setImage(#imageLiteral(resourceName: "threecard_360"), for: .normal)
        result.isHidden = false
        result.text = "You Lose"
        kingButton.isEnabled = false
        backButton.isEnabled = false
        resetButton.isHidden = false
    }
    
    @IBAction func back(_ sender: UIButton) {
        backButton.setImage(#imageLiteral(resourceName: "threecard_360"), for: .normal)
        result.isHidden = false
        result.text = "You Lose"
        kingButton.isEnabled = false
        threeButton.isEnabled = false
        resetButton.isHidden = false
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        result.isHidden = true
        kingButton.isEnabled = true
        backButton.isEnabled = true
        threeButton.isEnabled = true
        kingButton.setImage(#imageLiteral(resourceName: "cardbackred_720"), for: .normal)
        backButton.setImage(#imageLiteral(resourceName: "cardbackred_720"), for: .normal)
        threeButton.setImage(#imageLiteral(resourceName: "cardbackred_720"), for: .normal)
        resetButton.isHidden = true
        result.text = "Let's Play!"
    }
}

//reset button enables all cards to true
