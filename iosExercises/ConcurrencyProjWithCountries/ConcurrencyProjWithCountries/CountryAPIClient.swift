//
//  CountryAPIClient.swift
//  ConcurrencyProjWithCountries
//
//  Created by Lisa J on 11/30/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class CountryAPIClient {
    private init() {}
    static let manager = CountryAPIClient()
    func getCountries(from urlStr: String, completionHandler: @escaping ([Country]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let country = try JSONDecoder().decode([Country].self, from: data)
                completionHandler(country)
            } catch let error {
                errorHandler(error)
                
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
