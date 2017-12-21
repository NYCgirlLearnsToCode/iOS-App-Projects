//
//  SettingsViewController.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/21/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var pickerView2: UIPickerView!
    var categoryList = [CategoryInfo]() {
        didSet {
            pickerView2.reloadAllComponents()
            //needed to load picker titles
            pickerView2.selectRow(DataModel.selectedPickerRow, inComponent: 0, animated: false)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView2.delegate = self
        pickerView2.dataSource = self
        loadPickerData()
        
    }
    func loadPickerData() {
        let key = "d25bbcfec3b1417b814cb3e5dab750a4"
        let urlStr = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(key)"
        let setCategories: ([CategoryInfo]) -> Void = {(onlineCategory: [CategoryInfo]) in
            self.categoryList = onlineCategory
            //print("starting",self.categories, "here")
        }
        CategoryAPIClient.manager.getCategories(from: urlStr,
                                                completionHandler: setCategories,
                                                errorHandler: {print($0, "error getting categories")})
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(row, forKey: "SelectedRow")
        print("set default")
        
    }
}


extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.categoryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let setting = categoryList[row].list_name_encoded
        UserDefaults.standard.set(setting, forKey: "SelectedSetting")
        return categoryList[row].list_name
    }
    
    
}

