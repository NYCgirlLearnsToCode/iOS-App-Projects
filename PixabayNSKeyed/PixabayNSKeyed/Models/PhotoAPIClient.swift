//
//  PhotoAPIClient.swift
//  PixabayNSKeyed
//
//  Created by Lisa J on 12/12/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
import UIKit

enum HTTPVerb: String {
    case GET
    case POST
}
struct PhotoAPIClient {
    private init() {}
    static let manager = PhotoAPIClient()
    func getPhotos(from searchTerm: String, completionHandler: @escaping
        ([Photos]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let key = "7316927-2a8380daf1fdd7eb7b23df261"
        let urlStr = "https://pixabay.com/api/?key=\(key)&q=\(searchTerm)&image_type=photo"
        guard let url = URL(string: urlStr) else {errorHandler(AppError.badURL); return}
        let completion = {(data: Data) in //parseDataIntoElementArr
            do {
                let onlinePhotos = try JSONDecoder().decode(PhotoInfo.self, from: data)//is this where it is unwrapped bc its a dictionary in an array?
                let hitsInfo = onlinePhotos.hits
                completionHandler(hitsInfo)
            } catch let error{
                
                errorHandler(AppError.codingError(rawError: error))
                
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
class ImageAPIClient {
    private init() {}
    static let manager = ImageAPIClient()
    func getImage(from urlStr: String,
                  completionHander: @escaping (UIImage) -> Void,
                  errorHander: @escaping (AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHander(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else {
                errorHander(.notAnImage)
                return
            }
            completionHander(onlineImage)
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: {print($0)})
    }
}
