//
//  MovieAPI.swift
//  TestingApp
//
//  Created by Lisa J on 4/24/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

class MovieAPI {
    private init() {}
    static let manager = MovieAPI()
    func searchMovies(url: String, completionHandler: @escaping([Movie]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let urlString = url
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url:url)
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let movie = try JSONDecoder().decode(MovieSearch.self, from: data)
                //decode everything (outmost layer)                                 from: data)
                
                let results = movie.results
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
    

