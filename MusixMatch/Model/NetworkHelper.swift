//
//  NetworkHelper.swift
//  MusixMatch
//
//  Created by Lisa J on 12/4/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
class NetworkHelper{
    private init(){}
    static let manager = NetworkHelper()
    private let session = URLSession(configuration: .default)
    func performDataTask(with url: URL, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        let task = session.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else {errorHandler(AppError.badData); return}
                if let error = error {
                    errorHandler(error)
                }
                completionHandler(data)//passes data to apiclient
            }
        }
        task.resume()
    }
}
