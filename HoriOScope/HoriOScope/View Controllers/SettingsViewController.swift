//
//  SettingsViewController.swift
//  HoriOScope
//
//  Created by Lisa J on 12/11/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
//sets user defaults
    
    let signs = ["Aries", "Leo", "Sagittarius", "Taurus", "Virgo", "Capricorn", "Gemini", "Libra", "Aquarius", "Cancer", "Scorpio", "Pisces"]
    
    let myDates = ["today", "yesterday","tomorrow"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        if let newName = nameTF.text {
            UserDefaultsHelper.manager.setName(to: newName)
        }
        let newSign = signs[pickerView.selectedRow(inComponent: 0)]
        UserDefaultsHelper.manager.setSign(to: newSign)
        
    }
   
}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return signs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return signs[row]
    }
}
