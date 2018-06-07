//
//  ViewController.swift
//  fuzzDataTask
//
//  Created by Lisa J on 6/7/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataList = [FuzzData]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getFuzzData()
       
    }
    
    private func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url){(data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
   
    
    private func getFuzzData() {
        let endpoint = "http://quizzes.fuzzstaging.com/quizzes/mobile/1/data.json"
        let url = URL(string: endpoint)
        URLSession.shared.dataTask(with: url!){(data, response,error) in
            guard let data = data else {return}
            do {
                let jsonDecoder = JSONDecoder()
                let fuzzData = try jsonDecoder.decode([FuzzData].self, from: data)
                self.dataList = fuzzData
                print(fuzzData)
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
   

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fuzzCell", for: indexPath)
        let data = dataList[indexPath.row]
        cell.imageView?.image = nil
        func getImage(url: URL) {
            getDataFromUrl(url: url, completion: {(data, response,error) in
                guard let data = data, error == nil else {return}
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: data)
                    cell.setNeedsLayout()
                }
            })
        }
        if let imageURL = URL(string: data.data ?? "") {
            getImage(url: imageURL)
        } else {
            cell.imageView?.image = #imageLiteral(resourceName: "cat")
        }
        
        cell.textLabel?.text = data.data ?? "no data available"
        cell.detailTextLabel?.text = data.date ?? "no date available"
        return cell
    }
}

