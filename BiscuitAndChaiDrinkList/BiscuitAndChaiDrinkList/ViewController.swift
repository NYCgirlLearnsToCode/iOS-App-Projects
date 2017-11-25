//
//  ViewController.swift
//  BiscuitAndChaiDrinkList
//
//  Created by Lisa J on 11/22/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var drinkList = [DrinkWrapper]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 100
        
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "drinklist", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    //outer wrapper
                    let drinkList = try myDecoder.decode([DrinkWrapper].self, from: data)
                    self.drinkList = drinkList
                    print("load data works")
                }catch let error{
                    print(error)
                    
                }
            }
        }
        for drink in drinkList {
            print(drink.Image)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drink = drinkList[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Drink cell", for: indexPath)
        if let cell = cell as? DrinkTableViewCell {
        cell.testLabel.text = drink.Name
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "drinksegue" {
            if let destination = segue.destination as? DrinkDetailViewController {
                    let row = tableView.indexPathForSelectedRow!.row
                    destination.drink = self.drinkList[row]
            }
        }
    }
}

