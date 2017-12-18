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
    
    var categories = [CategoryInfo]() {
        didSet {
            pickerView.reloadAllComponents()
            //needed to load picker titles
        }
        
    }
    var selectedCategory = ""
    var bestSellers = [BestSellerInfo]() {
        didSet {
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
    }
    let cellSpacing = UIScreen.main.bounds.size.width * 0.05
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        loadData()
        loadBestSellers()
        
        
    }
    
    func loadData() {
        let key = "d25bbcfec3b1417b814cb3e5dab750a4"
        let urlStr = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(key)"
        let setCategories: ([CategoryInfo]) -> Void = {(onlineCategory: [CategoryInfo]) in
            self.categories = onlineCategory
            //print("starting",self.categories, "here")
        }
        CategoryAPIClient.manager.getCategories(from: urlStr, completionHandler: setCategories, errorHandler: {print($0, "error getting categories")})
    }
    
    func loadBestSellers() {
        let key = "d25bbcfec3b1417b814cb3e5dab750a4"
        let urlStr = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(key)&list=\(selectedCategory)"
        let setBestSellers: ([BestSellerInfo]) -> Void = {(onlineBestSellers: [BestSellerInfo]) in
            self.bestSellers = onlineBestSellers
        }
        print("loaded",selectedCategory)
        BestSellerAPIClient.manager.getBestSellers(from: urlStr, completionHandler: setBestSellers, errorHandler: {print($0, "error getting best sellers")})
    }
    
}

extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //print("number of rows",self.categories.count)
        return self.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //print("TITLES")
        return categories[row].list_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case pickerView:
            selectedCategory = self.categories[row].list_name_encoded
            loadBestSellers()
            print("in picker switch")
        //print(selectedCategory)
        default:
            break
        }
    }
}

extension BestSellersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("best",bestSellers.count)
        return bestSellers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bestSeller = bestSellers[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as! BestSellerCell
        cell.weeksLabel.text = "\(bestSeller.weeks_on_list) weeks on the best seller list"
        
        
        return cell
    }
}

extension BestSellersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numCells: CGFloat = 1
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: screenHeight * 0.55)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}


