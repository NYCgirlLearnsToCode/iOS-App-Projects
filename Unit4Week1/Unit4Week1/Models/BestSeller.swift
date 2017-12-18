//
//  BestSeller.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/17/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct BestSellerWrapper: Codable {
    let results: [BestSellerInfo]
}
struct BestSellerInfo: Codable {
    let weeks_on_list: Int
    let isbns: [IsbnInfo]
}
struct IsbnInfo: Codable {
    let isbn10: String
}

class BestSellerAPIClient {
    private init() {}
    static let manager = BestSellerAPIClient()
    func getBestSellers(from urlStr: String, completionHandler: @escaping ([BestSellerInfo]) -> Void, errorHandler: @escaping (Error) -> Void ){
        guard let url = URL(string: urlStr) else {return}
        let request = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let allResults = try JSONDecoder().decode(BestSellerWrapper.self, from: data)
                let bestSellers = allResults.results
                completionHandler(bestSellers)
            } catch{
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
}
//https://api.nytimes.com/svc/books/v3/lists.json?api-key=d25bbcfec3b1417b814cb3e5dab750a4&list=mass-market-paperback
