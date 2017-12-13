//
//  ViewController.swift
//  APIKeysRecipe
//
//  Created by Lisa J on 12/4/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar:UISearchBar!
    
    var recipes = [Recipe]()
    var searchTerm = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

