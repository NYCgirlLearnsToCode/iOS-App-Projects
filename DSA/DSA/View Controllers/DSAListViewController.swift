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
        
    }

@IBAction func addDSAItem(_ sender: UIBarButtonItem) {

}
    


}
extension DSAListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DSA cell", for: indexPath)
        return cell
    }
}

extension DSAListViewController: UITableViewDelegate {
    
}
