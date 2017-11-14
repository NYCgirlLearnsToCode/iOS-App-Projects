//
//  ViewController.swift
//  ControlsReview
//
//  Created by Lisa J on 11/9/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0{
        didSet {//property observer
            slider.value = Float(currentValue)
            stepper.value = Double(currentValue)
            label.text = "\(currentValue)"
        }
    }
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentValue = 50
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.currentValue = Int(sender.value)
    }
    @IBAction func stepper(_ sender: UIStepper) {
        self.currentValue = Int(sender.value)
    }
}
