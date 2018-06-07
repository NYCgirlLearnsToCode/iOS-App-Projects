//
//  ViewController.swift
//  DSA
//
//  Created by Lisa J on 12/12/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class DSAListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print(DataModel.shared.documentsDirectory())
        DataModel.shared.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    
    @IBAction func addDSAItem(_ sender: UIBarButtonItem) {
    
    }
    
        
}
extension DSAListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.shared.getLists().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DSA cell", for: indexPath)
        let dsaItem = DataModel.shared.getLists()[indexPath.row]
        cell.textLabel?.text = dsaItem.dsaTitle
        cell.detailTextLabel?.text = dsaItem.dsaDescription
        return cell
    }
}

extension DSAListViewController: UITableViewDelegate {
    
}
