//
//  NewOrderViewController.swift
//  BasicAuthAndPost
//
//  Created by Lisa J on 12/5/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class NewOrderViewController: UIViewController {
    @IBOutlet weak var orderNameTF: UITextField!
    @IBOutlet weak var orderCostTF: UITextField!
    
    @IBAction func postButtonPressed(_ sender: Any) {
        guard let orderName = self.orderNameTF.text else {
            return
        }
        guard let orderCostStr = self.orderCostTF.text else {
            return
        }
        guard let orderCost = Int(orderCostStr) else {return}
        print(orderName, orderCost)
        self.orderNameTF.text = ""//clears itself out
        self.orderCostTF.text = ""
    //Mkae POST request with orderName and orderCost
        let newOrder = Order(name: orderName, totalCost: orderCost)
        OrderAPIClient.manager.post(order: newOrder){print($0)}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
}
