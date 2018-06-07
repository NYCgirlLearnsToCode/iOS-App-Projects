//
//  ViewController.swift
//  TestingApp
//
//  Created by Lisa J on 4/24/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    var filteredMovies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    var imageURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadMovies() {
        let url = "https://itunes.apple.com/search?media=movie&term=comedy&limit=100"
        let completion = {(onlineMovies: [Movie]) in
            self.movies = onlineMovies
            self.filteredMovies = self.movies.filter({$0.contentAdvisoryRating.contains("Unrated")})
            print("filtered",self.filteredMovies.count)
        }
        MovieAPI.manager.searchMovies(url: url, completionHandler: completion, errorHandler: {print($0)})
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = filteredMovies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = movie.trackName
        cell.imageView?.image = #imageLiteral(resourceName: "na")
        func success(img: UIImage) {
            cell.imageView?.image = img;
            print("success")
        }
        imageURL = movie.artworkUrl100
        
        ImageAPIClient.manager.loadImage(from: imageURL, completionHandler: success, errorHandler:{print($0.localizedDescription)})
        
        return cell
    }
    
}
