//
//  FuzzAPIClient.swift
//  FuzzTest
//
//  Created by Lisa J on 5/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct FuzzAPIClient {
    private init() {}
    static let manager = FuzzAPIClient()
    func getData(from urlStr: String, completionHandler: @escaping ([FuzzData]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else  {return}
        let request = URLRequest(url:url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let allResults = try JSONDecoder().decode([FuzzData].self, from: data)
                let allWeather = allResults
                completionHandler(allWeather)
               
            } catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
}

