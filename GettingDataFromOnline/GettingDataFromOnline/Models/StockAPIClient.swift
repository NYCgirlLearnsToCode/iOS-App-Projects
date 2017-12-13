//
//  StockAPIClient.swift
//  GettingDataFromOnline
//
//  Created by Lisa J on 11/27/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class StockAPIClient {//singleton
    private init() {}
        static let manager = StockAPIClient()//only 1 netwrk request at a time
    func getStock(from urlStr: String, completionHandler: @escaping (Stock) -> Void, errorHandler: @escaping (Error) -> Void ) {
            guard let url = URL(string: urlStr) else {return}
            let completion: (Data) -> Void = {(data: Data) in
                do {
                    let stock = try JSONDecoder().decode(Stock.self, from:  data)
                    completionHandler(stock)
                }catch let error{
                    errorHandler(error)
                }
            }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
