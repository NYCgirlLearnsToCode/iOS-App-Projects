//
//  CriticsViewController.swift
//  NYTMovieReviews
//
//  Created by Lisa J on 12/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class CriticsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var critics = [CriticInfo](){
        didSet{
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
   
    func loadData() {
            //TODO: load Data
        CriticAPIClient.manager.getCritics(completionHander: {self.critics = $0.results}, errorHandler: {print($0)})
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
extension CriticsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return critics.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let critic = critics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Critic cell", for: indexPath)
        cell.textLabel?.text = critic.display_name
        cell.imageView?.image = #imageLiteral(resourceName: "na")
        func success(img: UIImage){
            cell.imageView?.image = img;
            print("success")
        }
        if let imageURL = critic.multimedia?.resource.src {
            ImageAPIClient.manager.loadImage(from: imageURL,
                                             completionHandler: success,
                                             errorHandler: {print("Image not loading ", $0.localizedDescription)})
        }
        return cell
    }
}
    


