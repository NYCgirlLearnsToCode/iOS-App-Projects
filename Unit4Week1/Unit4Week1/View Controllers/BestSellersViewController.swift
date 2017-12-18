//
//  ViewController.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var allCategories = [String]()
    var categories : CategoryInfo? {
        didSet {
            allCategories = [(categories?.list_name)!]
            print(allCategories)
            self.pickerView.reloadAllComponents()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pickerView.delegate = self
//        pickerView.dataSource = self
        loadData()
        
    }
    
    func loadData() {
        let key = "d25bbcfec3b1417b814cb3e5dab750a4"
        let urlStr = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(key)"
        let setCategories: ([CategoryInfo]) -> Void = {(onlineCategory: [CategoryInfo]) in
            self.categories = onlineCategory
        }
        CategoryAPIClient.manager.getCategories(from: urlStr, completionHandler: setCategories, errorHandler: {print($0, "error getting categories")})
    }

    

}

extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.categories.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case pickerView:
            loadData(from: self.categories[row])
        default:
            break
        }
    }
}

