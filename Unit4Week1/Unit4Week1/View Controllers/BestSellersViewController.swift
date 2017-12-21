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
    var isbn = ""
    
   // let googleBooks = [GoogleBookWrapper]()
    var googleSmallImg = ""
    var googleBooksDetails: GoogleBookWrapper?
    var bestSellers = [BestSellerInfo]() {
        didSet {
            DispatchQueue.main.async{
                //self.loadGoogleBook()
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
        //loadGoogleBook()
        
        
    }
    
    func loadData() {
        let key = "d25bbcfec3b1417b814cb3e5dab750a4"
        let urlStr = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(key)"
        let setCategories: ([CategoryInfo]) -> Void = {(onlineCategory: [CategoryInfo]) in
            self.categories = onlineCategory
            //print("starting",self.categories, "here")
        }
        CategoryAPIClient.manager.getCategories(from: urlStr,
                                                completionHandler: setCategories,
                                                errorHandler: {print($0, "error getting categories")})
    }
    
    func loadBestSellers() {
        let key = "d25bbcfec3b1417b814cb3e5dab750a4"
        let urlStr = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(key)&list=\(selectedCategory)"
        let setBestSellers: ([BestSellerInfo]) -> Void = {(onlineBestSellers: [BestSellerInfo]) in
            self.bestSellers = onlineBestSellers
        }
        print("loaded",selectedCategory)
        BestSellerAPIClient.manager.getBestSellers(from: urlStr,
                                                   completionHandler: setBestSellers,
                                                   errorHandler: {print($0, "error getting best sellers")})
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
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsegue" {
            let detailVC = segue.destination as? BestSellerDetailViewController
            let cell = sender as! BestSellerCell
            if let indexPath = collectionView.indexPath(for: cell) {
                detailVC?.googleBookDetail = googleBooksDetails
                detailVC?.image = cell.imageView.image
            
            }
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
        isbn = bestSeller.book_details[0].primary_isbn13
        print(isbn)
        print("isbn 13 \(bestSeller.book_details[0].primary_isbn13)")
         let url = "https://www.googleapis.com/books/v1/volumes?q=+isbn:\(isbn)&key=AIzaSyC4H3SJt83MHITUMcOKPfo9oCCFygNf7Dk"
        print(url)
        
        let completion = {(onlineBooks: GoogleBookWrapper) in
            let imageUrlStr = onlineBooks.volumeInfo.imageLinks.smallThumbnail
                self.googleBooksDetails = onlineBooks
            print("info \(self.googleBooksDetails?.searchInfo?.textSnippet)")
            let completion2: (UIImage?) -> Void = {(onlineImage: UIImage?) in
                if let onlineImage = onlineImage {
                    cell.imageView?.image = onlineImage
                        print("set image")
                        cell.setNeedsLayout()
                }
            }
                ImageAPIClient.manager.getImage(from: imageUrlStr,
                                                completionHandler: completion2,
                                                errorHandler: {print($0)})
        }
        GoogleBookAPIClient.manager.getBooks(from: url,
                                             completionHandler: completion,
                                             errorHandler: {print($0)})
        
//        print("url is \(url)")
        if let bookdescrip = bestSeller.book_details.first?.description {
            cell.textView.text = "\(bookdescrip)"
            if bookdescrip == "" {
                cell.textView.text = "Book descrip is n/a"
            }
            //loadGoogleBook()
//            if let googleSmallImg = googleBook?.volumeInfo.imageLinks.thumbnail {
//                print("set image to \(googleSmallImg)")
//                let completion: (UIImage) -> Void = {(onlineImage: UIImage) in
//                    cell.imageView?.image = onlineImage
//                    cell.setNeedsLayout()
//                }
//                ImageAPIClient.manager.getImage(from: googleSmallImg, completionHandler: completion, errorHandler: {print($0)})
//                print(googleBook!.volumeInfo.imageLinks.smallThumbnail)
        }
        
        
        
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


