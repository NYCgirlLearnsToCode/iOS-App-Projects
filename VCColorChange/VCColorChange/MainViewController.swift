//
//  ViewController.swift
//  VCColorChange
//
//  Created by Lisa J on 12/21/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit
//conforming to setColorVCDelegate
class MainViewController: UIViewController, setColorVCDelegate {
    func changeBackgroundColor(color: UIColor) {
        print("received message from delegate")
        view.backgroundColor? = color
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController {//bc modally and it hasits own nav controller
            let secondVC = nav.childViewControllers.first as! SetColorViewController
            secondVC.delegate = self
        }
    }

}

