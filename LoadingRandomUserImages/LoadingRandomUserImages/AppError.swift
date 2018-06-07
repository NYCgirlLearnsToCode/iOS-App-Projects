//
//  AppError.swift
//  LoadingRandomUserImages
//
//  Created by Lisa J on 11/28/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case other(rawError: Error)
    case notAnImage
}
