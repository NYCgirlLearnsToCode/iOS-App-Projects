//
//  ViewController.swift
//  PixabayNSKeyed
//
//  Created by Lisa J on 12/12/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {
    var photos = [Photos]() {
        didSet {
            tableView.reloadData()
        }
    }
    var searchTerm: String = "" {
        didSet {
            loadData(named: searchTerm.lowercased())
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
       
    }

    func loadData(named str: String) {
        let setPhotos = {(onlinePhotos: [Photos]) in
            self.photos = onlinePhotos
            }
        PhotoAPIClient.manager.getPhotos(from: str, completionHandler: setPhotos, errorHandler: {print($0)})
    }

}
extension PhotoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photo = photos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Photo cell", for: indexPath)
        cell.textLabel?.text = photo.tags
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PhotoDetailViewController {
            destination.photoDetail = photos[tableView.indexPathForSelectedRow!.row]
        }
    }
}
extension PhotoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTerm = searchBar.text ?? ""
    }
}







