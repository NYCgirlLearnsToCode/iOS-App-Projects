//
//  ViewController.swift
//  ParsingJSONMusic
//
//  Created by Lisa J on 11/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var albums = [Album]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData() {
        //beginning of url
        if let path = Bundle.main.path(forResource: "music", ofType: "json") {
                let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
            //if no data return optional val
                self.albums = Album.getAlbums(from: data)
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = albums[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Album cell", for: indexPath)
        cell.textLabel?.text = album.collectionName
        cell.detailTextLabel?.text = album.artistName
        return cell
    }
}

