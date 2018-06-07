//
//  CriticInfo.swift
//  NYTMovieReviews
//
//  Created by Lisa J on 12/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct CriticWrapper: Codable {
    let results: [CriticName]
}
struct CriticName: Codable {
    let display_name: String
    let multimedia : ImageWrapper
}

struct ImageWrapper: Codable {
    let resource: SrcWrapper
}

struct SrcWrapper: Codable {
    let src: String?
}
//Movie Reviews API: d25bbcfec3b1417b814cb3e5dab750a4
//Critics endpoint https://api.nytimes.com/svc/movies/v2/critics/all.json?api-key=d25bbcfec3b1417b814cb3e5dab750a4

struct CriticAPIClient {
    private init() {}
    static let manager = CriticAPIClient()
    let urlStr = "https://api.nytimes.com/svc/movies/v2/critics/all.json?api-key=d25bbcfec3b1417b814cb3e5dab750a4"
    func getCritics(completionHander: @escaping (CriticWrapper) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {errorHandler(AppError.badURL(str: urlStr))
            return
        }
        let request = URLRequest(url:url)
        let parseDataIntoCritics: (Data) -> Void = {(data) in
            do {
                let results = try JSONDecoder().decode(CriticWrapper.self, from: data)
                let critics = results
                completionHander(critics)
            } catch {
                errorHandler(AppError.codingError(rawError: error))
                
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: parseDataIntoCritics, errorHandler: errorHandler)
    }
    
}
