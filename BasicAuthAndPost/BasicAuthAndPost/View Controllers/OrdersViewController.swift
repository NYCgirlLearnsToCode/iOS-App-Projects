//
//  OrdersViewController.swift
//  BasicAuthAndPost
//
//  Created by Lisa J on 12/5/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {
    var orders = [Order]()
    
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
       //pull to refresh
        self.refreshControl.addTarget(self, action: #selector(refreshOrders(_:)), for: UIControlEvents.valueChanged)
        tableView.refreshControl = refreshControl
        loadOrders()
        // Do any additional setup after loading the view.
    }
    
    @objc private func refreshOrders(_ sender: Any) {
        loadOrders()
    }
    
    func loadOrders() {
        //TO DO
        let setOrdersToOnlineOrders = {(onlineOrders: [Order]) in
            self.orders = onlineOrders
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
        let printErrors = {(error: Error) in
            print(error)
            self.refreshControl.endRefreshing()
        }
        //use OrderAPIClient to get orders
        OrderAPIClient.manager.getOrders(completionHandler: setOrdersToOnlineOrders, errorHandler: printErrors)
    }
}
    extension OrdersViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return orders.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let order = orders[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Order cell", for: indexPath)
            cell.textLabel?.text = order.name 
            cell.detailTextLabel?.text = "Price: \((order.totalCost != nil ?String(order.totalCost!) : "n/a"))"
            //print(order.totalCost)
            return cell
        }
    }

