//
//  ViewController.swift
//  CustomTableViewCells
//
//  Created by C4Q  on 10/31/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadData() {
        let allMovies = MovieData.movies
        let sortedMovies = allMovies.sorted{$0.name < $1.name}
        self.movies = sortedMovies
    }
    
    //Two required Data Source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath)
        let rowToSetUp = indexPath.row
        let movieToSetUp = movies[rowToSetUp]
        cell.textLabel?.text = movieToSetUp.name
        cell.detailTextLabel?.text = movieToSetUp.description
       // cell
        return cell
    }
    
    @IBAction func sortButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.movies = movies.sorted{$0.genre < $1.genre}
        case 1:
            self.movies = movies.sorted{$0.name < $1.name}
        default:
            break
        }
        tableView.reloadData()
    }
}


