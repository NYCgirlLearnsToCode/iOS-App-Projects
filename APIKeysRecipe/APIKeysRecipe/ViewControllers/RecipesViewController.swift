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
    
    var recipes = [Recipe]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    var searchTerm = "" {
        didSet {
            loadRecipes(named: searchTerm)
        }
    }
    
    func loadRecipes(named str: String) {
        //TO DO
        //Use our recipe API Client to get recipes and set self.recipes equal to the new recipes
        let setRecipes = {(onlineRecipes: [Recipe]) in
            self.recipes = onlineRecipes
        }
        let printErrors = {(error: Error) in
            print(error)
        }
        RecipeAPIClient.manager.getRecipes(named: str, completionHandler: setRecipes, errorHandler: printErrors)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension RecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recipe cell", for: indexPath)
        cell.textLabel?.text = recipe.name
        cell.detailTextLabel?.text = recipe.source
        return cell
    }
}

extension RecipesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = self.searchBar.text ?? ""
    }
}
