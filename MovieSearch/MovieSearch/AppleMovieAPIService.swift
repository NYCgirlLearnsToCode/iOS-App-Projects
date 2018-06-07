//
//  AppleMovieAPIService.swift
//  MovieSearch
//
//  Created by Lisa J on 12/15/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct AppleMovieAPIClient {
    
    private init() {}
    
    static let manager = AppleMovieAPIClient()
    
    let searchURL = "https://itunes.apple.com/search?media=movie&term="
    
    let session = URLSession.shared
    
    func searchMovie(keyword: String, completion: @escaping (Error?, [Movie]?) -> Void) {
        
        guard let encodedString = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        session.dataTask(with: URL(string: "\(searchURL)\(encodedString)")!,
                         
                         completionHandler: {(data, response, error) in
                            
                            if let error = error {
                                
                                completion(error, nil)
                                
                            } else if let data = data {
                                
                                do {
                                    
                                    let decoder = JSONDecoder()
                                    
                                    let rawResults = try decoder.decode(MovieResults.self, from: data)
                                    
                                    completion(nil, rawResults.results)
                                    
                                    
                                    
                                }
                                    
                                catch {
                                    
                                    print("Coding Error \(error.localizedDescription)")
                                    
                                }
                                
                            }
                            
        }).resume()
        
    }
    
}
