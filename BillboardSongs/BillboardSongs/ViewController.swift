//
//  ViewController.swift
//  BillboardSongs
//
//  Created by Lisa J on 11/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var songs = [Song]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    func loadData() {
        if let path = Bundle.main.path(forResource: "BillboardSongs", ofType: "json") {
            print("path works")
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.songs = Song.getSong(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Song cell" , for: indexPath)
        cell.textLabel?.text = song.songName
        cell.detailTextLabel?.text = song.displayArtist
        return cell
    }

}

