//
//  ViewController.swift
//  FlashlightApp
//
//  Created by Lisa J on 10/17/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    @IBAction func flashlight(_ sender: UIButton) {
        switch self.view.backgroundColor == .white {
        case true:
            self.view.backgroundColor = .black
        case false:
            self.view.backgroundColor = .white
        }
        
    }
    

}

