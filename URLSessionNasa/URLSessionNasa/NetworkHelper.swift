//
//  NetworkHelper.swift
//  URLSessionNasa
//
//  Created by Lisa J on 12/1/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    private let mySession = URLSession(configuration: .default)
    func performDataTask(with url: URL, completionHandler:@escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        mySession.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {return}
            DispatchQueue.main.async {
            if let error = error {
                errorHandler(error)
                return
                }
                completionHandler(data)
            }
        }.resume()//needs this to start the data task
        
    }
}
