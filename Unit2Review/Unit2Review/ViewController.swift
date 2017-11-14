//
//  ViewController.swift
//  Unit2Review
//
//  Created by Lisa J on 11/9/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1// number of pickers
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alphabet.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(alphabet[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    @IBAction func testButton(_ sender: UIButton) {
        // 2 buttons in 1 func
        switch sender.tag {
        case 1:
            print("1")
        case 2:
            print("2")
        default:
            print("?")
        }
    }
    
}

