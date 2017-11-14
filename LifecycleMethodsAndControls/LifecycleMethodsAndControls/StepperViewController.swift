//
//  StepperViewController.swift
//  LifecycleMethodsAndControls
//
//  Created by Lisa J on 11/7/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController, UITextFieldDelegate {
    
    var currentVal: Double = 0 {
        didSet {
            stepperLabel.text = String(currentVal)
            stepper.value = currentVal
            textField.text = String(Int(currentVal))
        }
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        currentVal = stepper.value
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        currentVal = sender.value
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        currentVal = 0
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(range.upperBound - range.lowerBound)
        //Deletion handling
        guard range.upperBound - range.lowerBound == 0 else {
            var currentText = textField.text!
            currentText.remove(at: currentText.index(currentText.startIndex, offsetBy: range.lowerBound))
            if currentText == "" {
                self.currentVal = 0
            } else {
                self.currentVal = Double(currentText)!
            }
            return false
        }
        guard Array("0123456789").contains(string.characters.first!) else {
            return false
        }
        let combinedText = textField.text! + string
        if let newInt = Int(combinedText) {
            self.currentVal = Double(newInt)
        }
        return false
    }
}
