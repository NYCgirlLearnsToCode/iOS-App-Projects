//
//  ViewController.swift
//  FuzzTest
//
//  Created by Lisa J on 5/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var currentImage = UIImage()
    var dataList = [FuzzData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 400
        loadData()
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if let cell = sender.superview?.superview as? FuzzTableViewCell {
                if cell.dataTextView.text != "  " {
                    showAlert(title: "No image available", message: "No image available")
                } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                detailViewController.selectedImage = currentImage;
                navigationController?.pushViewController(detailViewController, animated: true)
                }
            }
        case 1:
            sendToFuzzWebsite()
        case 2:
            sendToFuzzWebsite()
        case 3:
            sendToFuzzWebsite()
        case 4:
            sendToFuzzWebsite()
        default:
            print("clicked other")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func sendToFuzzWebsite() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let webViewController = storyboard.instantiateViewController(withIdentifier: "WebViewController")
        navigationController?.pushViewController(webViewController, animated: true)
    }
    private func loadData() {
        let endpoint = "http://quizzes.fuzzstaging.com/quizzes/mobile/1/data.json"
        let completion = {(onlineData: [FuzzData]) in
            self.dataList = onlineData
        }
        FuzzAPIClient.manager.getData(from: endpoint, completionHandler: completion, errorHandler: {print($0)})
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FuzzCell", for: indexPath) as! FuzzTableViewCell
        switch segmentedControl.selectedSegmentIndex {
        case 0:
        let imageUrl = data.data ?? "nil"
        cell.fuzzImageView.image = nil
        cell.activityIndicator.startAnimating()
        cell.configureCell(fuzzData: data)
        cell.activityIndicator.stopAnimating()
        cell.fuzzImageView.image = #imageLiteral(resourceName: "na")
        let completion : (UIImage) -> Void = {(onlineImage: UIImage) in
            cell.fuzzImageView.image = onlineImage
            self.currentImage = onlineImage
            cell.dataTextView.text = "  "
            cell.setNeedsLayout()
        }
        ImageAPIClient.manager.getImage(from: imageUrl, completionHandler: completion, errorHandler: {(print($0))})
        return cell
        case 1:
            let data = dataList[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FuzzCell", for: indexPath) as! FuzzTableViewCell
            cell.fuzzImageView.image = nil
            cell.activityIndicator.isHidden = true
            cell.configureCell(fuzzData: data)
            return cell
        default:
            print("none")
        }
    return cell
    }
    
    
}

