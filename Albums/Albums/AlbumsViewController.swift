//
//  ViewController.swift
//  Albums
//
//  Created by Lisa J on 11/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var albumTableView: UITableView!
    
    var albums = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let theAlbums = AlbumService.fetchAlbums() {
            albums = theAlbums
            albumTableView.dataSource = self
            albumTableView.reloadData()//loads data
            print("there are \(albums.count)")
        } else {
            print("no albums found")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}
extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Album cell", for: indexPath)
        let album = albums[indexPath.row]
        cell.textLabel?.text = album.collectionName
        
        
        //set image
        if let albumURL = URL(string: album.artworkUrl100) {
            //doing work on a background thread
            DispatchQueue.global().async {
                if let data = try? Data.init(contentsOf: albumURL) {
                    DispatchQueue.main.async {
                    
                        cell.imageView?.image = UIImage(data: data)
                    }
                }
            }
        }
        return cell
    }
}
