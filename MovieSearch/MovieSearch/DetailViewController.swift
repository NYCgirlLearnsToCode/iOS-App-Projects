//
//  DetailViewController.swift
//  MovieSearch
//
//  Created by Lisa J on 12/15/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(movie: Movie)
        
        // Do any additional setup after loading the view.
    }
    func configureView(movie: Movie) {
        movieTitle.text = movie.collectionName ?? "No Title"
        movieDescription.text = movie.longDescription ?? "No Description"
        DispatchQueue.global().async {
            
            do {
                
                let imageData = try Data.init(contentsOf: movie.artworkUrl100)
                
                DispatchQueue.main.async {
                    
                    self.imageView.image = UIImage.init(data: imageData)
                    
                }
                
            } catch {
                
                print("image processing error: \(error.localizedDescription)")
                
            }
            
        }
        
    }
    
}

@IBAction func addToFavorites(_ sender: UIBarButtonItem) {
}




}
