//
//  Review.swift
//  NYTMovieReviews
//
//  Created by Lisa J on 12/15/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
struct ReviewWrapper: Codable {
    let results: [ReviewResultInfo]
}

struct ReviewResultInfo: Codable {
    let display_title: String
    let byline: String
    let headline: String
    let summary_short: String
    let multimedia: ReviewImageWrapper
}
struct ReviewImageWrapper: Codable {
    let src: String
}

struct ReviewAPIClient {
    private init() {}
    static let manager = ReviewAPIClient()
    func getReviews(from urlStr: String, completionHandler: @escaping ([ReviewResultInfo]) -> Void,
          //completion handler pass in the info you want
                    errorHandler: @escaping (Error) -> Void) {
       guard let url = URL(string: urlStr) else {return}
        let request = URLRequest(url:url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let review = try JSONDecoder().decode(ReviewWrapper.self, from: data)
                //decode everything (outmost layer)                                 from: data)
                
                let results = review.results
                //bc it's in an array wrapper
                completionHandler(results)
                //pass in the info you want
            } catch let error{
                errorHandler(error)
            }
        }
       NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
}

//{
//  [
//      {
//
//      }
//  ]
//
//}
//https://api.nytimes.com/svc/movies/v2/reviews/search.json?reviewer=Manohla%20Dargis&api-key=d25bbcfec3b1417b814cb3e5dab750a4
