//
//  ColorViewController.swift
//  SeguesAndMultipleMVC
//
//  Created by Lisa J on 11/2/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var colorImageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        if let tbc = self.tabBarController {
        //            print(tbc.viewControllers)
        //            print(tbc.viewControllers?.count)
        }
   
        @IBAction func changeColor(_ sender: UIButton) {
            colorImageView.backgroundColor = .green//why isn't this lit up??
        }
    }


