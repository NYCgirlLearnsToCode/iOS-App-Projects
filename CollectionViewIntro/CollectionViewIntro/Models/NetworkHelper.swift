//
//  NetworkHelper.swift
//  CollectionViewIntro
//
//  Created by Lisa J on 12/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

enum AppError: Error {
    case noData
    case noInternet
    case badURL(string: String)
    case urlError(rawError: Error)
    case otherError(rawError: Error)
    case invalidImage
    case codingError(rawError: Error)
}

struct NetworkHelper{
    private init() {}
    static let manager = NetworkHelper()
    let session = URLSession(configuration: .default)
    func performDataTask(with request: URLRequest, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        let myDataTask = session.dataTask(with: request){(data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data else {errorHandler(AppError.noData); return}
                if let error = error as? URLError {
                    switch error {
                    case URLError.notConnectedToInternet: errorHandler(AppError.noInternet)
                        return
                    default:
                        errorHandler(AppError.urlError(rawError: error))
                    }
                }else {
                    if let error = error {
                        errorHandler(AppError.otherError(rawError: error))
                    }
                }
                //optional for printing data
                if let dataStr = String(data: data, encoding: .utf8) {
                    print(dataStr)
                }
                completionHandler(data)
            }
        }
        myDataTask.resume()
    }
}


