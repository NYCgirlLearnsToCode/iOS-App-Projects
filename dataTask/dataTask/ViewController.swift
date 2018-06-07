//
//  ViewController.swift
//  dataTask
//
//  Created by Lisa J on 6/7/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var githubs = [Github]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        callAPI()
    }

    private func callAPI(){
        let endpoint = "https://api.github.com/users/shashikant86"
        guard let url = URL(string: endpoint) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(Github.self, from: data)
                self.githubs = [gitData]
                print(gitData)
            } catch let error {
                print("error", error)
            }
        }.resume()
        
        
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
  
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "githubCell", for: indexPath)
            func downloadImage(url: URL) {
                print("Download Started")
                getDataFromUrl(url: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    print(response?.suggestedFilename ?? url.lastPathComponent)
                    print("Download Finished")
                    DispatchQueue.main.async() {
                        cell.imageView?.image = UIImage(data: data)
                    }
                }
            }
        let github = githubs[indexPath.row]
            let imageURL = URL(string: github.avatar_url)
            downloadImage(url: imageURL!)
        cell.textLabel?.text = github.login
        cell.detailTextLabel?.text = github.bio
        return cell
    }
}

