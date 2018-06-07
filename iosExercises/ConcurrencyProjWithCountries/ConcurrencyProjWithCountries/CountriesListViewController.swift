//
//  ViewController.swift
//  ConcurrencyProjWithCountries
//
//  Created by Lisa J on 11/30/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
import UIKit

class CountriesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
   
   
    @IBOutlet weak var searchBar:UISearchBar!
    
    var countries = [Country](){
        didSet {
            self.tableView.reloadData()
        }
    }
    var searchTerm:String = "" {
        didSet {
            loadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 100
        loadData()
        self.searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loadData() {
    let urlStr = "https://restcountries.eu/rest/v2/name/united"
        let completion: ([Country]) -> Void = {(countryList: [Country])in
        self.countries = countryList
        }
        CountryAPIClient.manager.getCountries(from: urlStr, completionHandler: completion, errorHandler: {print($0)})
    }


}
extension CountriesListViewController: UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country cell", for: indexPath)
        if let cell = cell as? CountryTableViewCell {
        cell.nameLabel.text = country.name
        cell.capitalLabel.text = country.capital
        cell.populationLabel.text = "\(country.population)"
        }
        return cell
    }
}

