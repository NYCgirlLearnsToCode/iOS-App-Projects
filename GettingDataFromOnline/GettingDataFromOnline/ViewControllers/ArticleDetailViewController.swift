//
//  ArticleDetailViewController.swift
//  GettingDataFromOnline
//
//  Created by Lisa J on 11/27/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var article: Article!
    var relatedArticles : [String] {
        return article.related.components(separatedBy: ",")
    }
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        updateUI()

        // Do any additional setup after loading the view.
    }
    func updateUI() {
        headlineLabel.text = article.headline
        sourceLabel.text = article.source
        dateLabel.text = article.datetime
        summary.text = article.summary
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return relatedArticles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let relatedArticle = relatedArticles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Article detail cell", for: indexPath)
        cell.textLabel?.text = relatedArticle
        return cell
    }

}
