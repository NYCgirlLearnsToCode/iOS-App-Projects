//
//  WeatherAPIClient.swift
//  OpenWeather
//
//  Created by Lisa J on 4/28/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct WeatherAPIClient {
    private init(){}
    static let manager = WeatherAPIClient()
    func getWeather(from urlStr: String, completionHandler: @escaping ([WeatherWrapper])-> Void, errorHandler: @escaping (Error)-> Void) {
        guard let url = URL(string: urlStr) else {return}
        let request = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let allResults = try JSONDecoder().decode(Weather.self, from: data)
                let allWeather = allResults.list
                completionHandler(allWeather)
            } catch let error{
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
}
