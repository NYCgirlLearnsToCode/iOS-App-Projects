//
//  ViewController.swift
//  OpenWeather
//
//  Created by Lisa J on 4/28/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mainInfo = [WeatherWrapper]() {
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
        loadWeather()
    }
    
    private func loadWeather() {
        let url = "https://api.openweathermap.org/data/2.5/forecast?zip=11220&APPID=b5713e3dff4e26fcee8f85f4744079a4"
        let completion = {(onlineWeather: [WeatherWrapper]) in
            self.mainInfo = onlineWeather
            print(self.mainInfo)
        }
        WeatherAPIClient.manager.getWeather(from: url, completionHandler: completion, errorHandler: {print($0)})
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weather = mainInfo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        cell.textLabel?.text = "\(weather.dtTxt) \((Double(weather.main.temp) - 273.15) * 9/5 + 32)) "
        return cell
    }
}

