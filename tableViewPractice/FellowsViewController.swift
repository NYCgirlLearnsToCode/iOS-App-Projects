//
//  FellowsViewController.swift
//  tableViewPractice
//
//  Created by Lisa J on 1/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class FellowsViewController: UIViewController {
    let fellowView = FellowView()
    var fellows = [Fellow]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(fellowView)
        fellowView.tableView.delegate = self
        fellowView.tableView.dataSource = self
        
        if let results = JSONParsingService.parseJSONFile(filename: "fellows", type: "json") {
            fellows = results
        }
    }
    
    

}

extension FellowsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fellows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fellow = fellows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FellowCell", for: indexPath)
        //TODO: Finish setting up cell
        cell.textLabel?.text = fellow.name
        return cell
    }
}

extension FellowsViewController: UITableViewDelegate {
    
}
