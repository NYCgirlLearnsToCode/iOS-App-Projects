//
//  TableViewViewController.swift
//  BehanceAPI
//
//  Created by Lisa J on 12/18/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    v
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "EmptyNib", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TableCell")
    }
}

extension TableViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
