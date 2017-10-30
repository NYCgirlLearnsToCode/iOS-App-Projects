//
//  ViewController.swift
//  MyFirstApp-Class
//
//  Created by Lisa J on 10/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var label: UILabel!
    //if empty circle<- delete & remake
    //if you change the name of the label have to remake^
    override func viewDidLoad() {
        let myColors: [(UIColor, String)] = [(.red, "red"), (.green, "green"),(.blue, "blue")]
        
        let randomIndex = Int(arc4random_uniform(3))
        let randomColor = myColors[randomIndex]
        self.view.backgroundColor = randomColor.0
        label.text = "The background color is \(randomColor.1)"
        super.viewDidLoad()
    }
    @IBAction func colorChangeButtonPressed(_ sender: UIButton) {
        let colorName: String
        let newColor: UIColor
        switch sender.tag {
        case 0:
            newColor = .red
            colorName = "red"
        case 1:
            newColor = .green
            colorName = "green"
        case 2:
            newColor = .blue
            colorName = "blue"
        default:
            newColor = .gray
            colorName = "gray"
        }
        self.view.backgroundColor = newColor
        self.label.text = "The background color is \(colorName)"
    }
}




