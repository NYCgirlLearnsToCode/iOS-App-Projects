//
//  ImageAPIClient.swift
//  NYTMovieReviews
//
//  Created by Lisa J on 12/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class ImageAPIClient {
    private init() {}
    static let manager = ImageAPIClient()
    func loadImage(from urlStr: String,
                   completionHandler: @escaping (UIImage) -> Void,
                   errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {errorHandler(AppError.badURL(str: urlStr)); return}
        let completion = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else {errorHandler(AppError.invalidImage); return}
            completionHandler(onlineImage)
        }
        NetworkHelper.manager.performDataTask(with: URLRequest(url: url),
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}

