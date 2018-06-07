//
//  AnimalPickerViewController.swift
//  CatOrDog
//
//  Created by Lisa J on 12/19/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//



import UIKit
class AnimalPickerController: UIViewController {
    
    
    
    @IBOutlet weak var catsCollectionView: UICollectionView!
    
    @IBOutlet weak var dogsCollectionView: UICollectionView!
    
    
    
    // constant for our cell spacing which will be consistent around our cells
    
    let cellSpacing: CGFloat = 10.0
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        // setup delegates and datasource
        
        
        
        // cat collection view
        
        catsCollectionView.dataSource = self
        
        catsCollectionView.delegate = self
        
        
        
        // dog collection view
        
        dogsCollectionView.dataSource = self
        
        dogsCollectionView.delegate = self
        
    }
    
}



extension AnimalPickerController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == catsCollectionView {
            
            return PhotoDataModel.getCatPhotos().count
            
        } else { // dogs
            
            return PhotoDataModel.getDogPhotos().count
            
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCell", for: indexPath) as! AnimalCell
        
        if collectionView == catsCollectionView {
            
            let photo = PhotoDataModel.getCatPhotos()[indexPath.row]
            
            configureCell(withPhoto: photo, forCell: cell)
            
        } else {
            
            let photo = PhotoDataModel.getDogPhotos()[indexPath.row]
            
            configureCell(withPhoto: photo, forCell: cell)
            
        }
        
        return cell
        
    }
    
    
    
    // helper function to configure cell
    
    func configureCell(withPhoto photo: Photo, forCell cell: AnimalCell) {
        
        // background thread to process image
        
        DispatchQueue.global().async {
            
            do {
                
                let imageData = try Data.init(contentsOf: photo.url_m)
                
                let image  = UIImage.init(data: imageData)
                
                // back to main thread to update UI
                
                DispatchQueue.main.async {
                    
                    cell.imageView.image = image
                    
                }
                
            } catch {
                
                print("image processing error: \(error.localizedDescription)")
                
            }
            
        }
        
    }
    
}



extension AnimalPickerController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numCells: CGFloat = 2.0 // cells visible in row
        
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width // screen width of device
        
        
        
        // retrun item size
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: collectionView.bounds.height - (cellSpacing * 2))
        
    }
    
    
    
    // padding around our collection view
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: cellSpacing, left: 0, bottom: cellSpacing, right: 0)
        
    }
    
    
    
    // padding between cells / items
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellSpacing
        
    }
    
    
    
}






































