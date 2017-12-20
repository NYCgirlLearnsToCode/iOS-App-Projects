//
//  Category.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/17/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct Category: Codable {
    let results: [CategoryInfo]
}

struct CategoryInfo: Codable {
    let list_name: String
    let list_name_encoded: String
}

class CategoryAPIClient {
    private init() {}
    static let manager = CategoryAPIClient()
    func getCategories(from urlStr: String, completionHandler: @escaping ([CategoryInfo]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let request = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let allResults = try JSONDecoder().decode(Category.self, from: data)
                let categories = allResults.results
                completionHandler(categories)
            }
            catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
}
