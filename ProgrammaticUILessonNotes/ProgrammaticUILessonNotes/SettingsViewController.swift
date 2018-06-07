//
//  SettingsViewController.swift
//  ProgrammaticUILessonNotes
//
//  Created by Lisa J on 1/2/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.dataSource = self
        pv.delegate = self
        return pv
    }()
    
    lazy var startingLabel: UILabel = {
        let label = UILabel()
        label.text = "Select the starting background color"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(pickerView)
        self.view.addSubview(startingLabel)
        setConstraints()
    }
    
    func setConstraints() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        pickerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        startingLabel.translatesAutoresizingMaskIntoConstraints = false
        startingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        startingLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AppColor.allColors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AppColor.allColors[row].name
    }
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //TO DO: Add to User Defaults
        print("selected row \(row)")
    }
}
