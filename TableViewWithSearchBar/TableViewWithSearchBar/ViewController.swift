//
//  ViewController.swift
//  TableViewWithSearchBar
//
//  Created by Lisa J on 11/6/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var personArr = [Person]()
    
    var filteredPersonArr: [Person] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return personArr
        }
        guard let scopeTitles = self.searchBar.scopeButtonTitles else {
            return personArr
        }
        let selectedIndex = self.searchBar.selectedScopeButtonIndex
        let filteringCriteria = scopeTitles[selectedIndex]
        switch filteringCriteria {
        case "Name":
            return personArr.filter{(person) in
                person.name.lowercased().contains(searchTerm.lowercased())
            }
        case "Location":
            return personArr.filter{(person) in
                person.location.lowercased().contains(searchTerm.lowercased())
            }
        default:
            return personArr
        }
    }
    
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        personArr = Person.allPeople
    }
    
    //MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Asking data source for #of rows and it is \(filteredPersonArr.count)")
        return filteredPersonArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = filteredPersonArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Person Cell", for: indexPath)
        cell.textLabel?.text = person.name
        print("Setting cell at row \(indexPath.row) and section \(indexPath.section) to \(person.name)")
        cell.detailTextLabel?.text = person.location
        return cell
    }
    
    //MARK: - Search Bar Delegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        print("The user pressed search!")
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()//if diff button scope clicked, reloads
    }
}



