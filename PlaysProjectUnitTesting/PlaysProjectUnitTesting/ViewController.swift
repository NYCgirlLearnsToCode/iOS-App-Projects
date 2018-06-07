//
//  ViewController.swift
//  PlaysProjectUnitTesting
//
//  Created by Lisa J on 2/12/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var playData = PlayData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showAlert))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playData.filteredWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let word = playData.filteredWords[indexPath.row]
        cell.textLabel?.text = word
        cell.detailTextLabel?.text = "\(playData.wordCounts.count(for: word))"
        return cell
    }
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "Add a filter", message: "do it now!", preferredStyle: .alert)
        alertController.addTextField()
        let okAction = UIAlertAction(title: "Ok", style: .default) {alert in
            //checking for nil. Returns 0 as default
            let userInput = alertController.textFields?[0].text ?? "0"
            self.playData.applyUserFilter(userInput)
            self.tableView.reloadData()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}

