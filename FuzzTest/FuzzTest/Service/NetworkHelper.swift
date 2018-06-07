//
//  NetworkHelper.swift
//  FuzzTest
//
//  Created by Lisa J on 5/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

enum AppError: Error {
    case codingError(rawError: Error)
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}

class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    func performDataTask(with request: URLRequest, completionHandler: @escaping ((Data) -> Void), errorHandler: @escaping ((AppError) -> Void)) {
        self.urlSession.dataTask(with: request){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else {
                    errorHandler(AppError.noDataReceived)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    errorHandler(AppError.badStatusCode)
                    return
                }
                completionHandler(data)
            }
            }.resume()
    }
}
