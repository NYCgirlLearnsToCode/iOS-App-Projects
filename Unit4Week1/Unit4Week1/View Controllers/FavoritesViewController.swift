//
//  FavoritesViewController.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/20/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    let cellSpacing = UIScreen.main.bounds.size.width * 0.05
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataModel.shared.getLists().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoritesCollectionViewCell
        let favorite = DataModel.shared.getLists()[indexPath.row]
        configureFave(favorite: favorite, forCell: cell)
        return cell
    }
    func configureFave(favorite: Favorites, forCell cell: FavoritesCollectionViewCell) {
        cell.titleLabel.text = favorite.title
        let url = favorite.imageUrl
        let completion: (UIImage?) -> Void = {(onlineImage: UIImage?) in
            if let onlineImage = onlineImage {
                cell.favBookImg.image = onlineImage
                print("set image")
                cell.setNeedsLayout()
            }
        }
        ImageAPIClient.manager.getImage(from: url!, completionHandler: completion, errorHandler: {print($0)})
    }
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 2
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: screenHeight * 0.38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(cellSpacing, 0, cellSpacing, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}













