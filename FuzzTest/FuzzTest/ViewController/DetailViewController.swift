//
//  DetailViewController.swift
//  FuzzTest
//
//  Created by Lisa J on 5/30/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedImage
    }

  
}
