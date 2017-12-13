//
//  ArticlesViewController.swift
//  GettingDataFromOnline
//
//  Created by Lisa J on 11/27/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]() {
        didSet {
            self.tableView.reloadData() // have to reload for cell data to show up in tableview
        }
    }
    var stock: Stock = Stock.defaultStock
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        //self.tableView.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
    func loadData() {
        let urlStr = "https://api.iextrading.com/1.0/stock/\(stock.symbol)/news/last/20"
        let completion: ([Article]) -> Void = {(onlineArticles: [Article]) in
            self.articles = onlineArticles
        }
        ArticleAPIClient.manager.getArticles(from: urlStr, completionHandler: completion, errorHandler: {print($0)})
    }
    

}
//same as mark just programmatically & for code separation
extension ArticlesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Article cell", for: indexPath)
        cell.textLabel?.text = article.headline
        cell.detailTextLabel?.text = article.source
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ArticleDetailViewController {
            destination.article = self.articles[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
