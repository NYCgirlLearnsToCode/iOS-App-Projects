//
//  ViewController.swift
//  XibNibExample
//
//  Created by Lisa J on 12/18/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class RandomImageViewController: UIViewController {

    @IBOutlet weak var pixabayView: PixabayView!
    
    var pixabay: Pixabay! {
        didSet{
            pixabayView.likesLabel.text = "\(pixabay.likes) Likes"
            pixabayView.tagsLabel.text = pixabay.tags
            pixabayView.imageView.image = #imageLiteral(resourceName: "Swift_logo.svg")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTestPixabay()
    }

    func loadTestPixabay() {
        self.pixabay = Pixabay.testPixabays[1]
    }

}

