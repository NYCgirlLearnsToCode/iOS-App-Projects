//
//  BestSellerDetailViewController.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/19/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class BestSellerDetailViewController: UIViewController {
    var googleBookDetail: GoogleBookWrapper!
    var image: UIImage!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = googleBookDetail?.volumeInfo.description
        
        subtitleLabel.text = googleBookDetail.volumeInfo.subtitle
        imageView.image = image
    }
    
    @IBAction func addToFavoritesButtonClicked(_ sender: UIButton) {
    
    
    }
    
}
