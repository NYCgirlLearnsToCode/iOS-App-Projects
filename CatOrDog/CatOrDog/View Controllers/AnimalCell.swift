//
//  AnimalCell.swift
//  CatOrDog
//
//  Created by Lisa J on 12/19/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class AnimalCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    
    // for use when caching to keep track of setting a cell's image
    var urlString: String = ""
}
