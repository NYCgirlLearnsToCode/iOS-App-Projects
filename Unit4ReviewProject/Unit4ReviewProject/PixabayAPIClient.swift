//
//  PixabayAPIClient.swift
//  Unit4ReviewProject
//
//  Created by Lisa J on 1/11/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

import Foundation

struct PixabayImages: Codable {
    let hits: [Hits]
}

struct Hits: Codable {
    let webformatURL: String
    let id: Int
}

struct PixabayAPIClient {
    private init() {}
    static let manager = PixabayAPIClient()
    func getImage(from urlStr: String, completionHandler: @escaping ([Hits]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let request = URLRequest(url:url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let allResults = try JSONDecoder().decode(PixabayImages.self, from: data)
                let allImages = allResults.hits
                completionHandler(allImages)
            } catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
    
}


