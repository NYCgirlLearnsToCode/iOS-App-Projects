//
//  Pixabay.swift
//  XibNibExample
//
//  Created by Lisa J on 12/18/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct 

struct PixabayResults: Codable {
    let likes : Int
    let tags: String
//    static let testPixabays = [
//        Pixabay(likes: 1, tags: "test 1"),
//        Pixabay(likes: 2, tags: "test 2"),
//        Pixabay(likes: 3, tags: "test 3")
//    ]
}
struct PixabayAPIClient {
    private init() {}
    static let manager = PixabayAPIClient()
    func getFirstImage(named str: String, completionHandler: @escaping (Pixabay) -> Void, ErrorHandler: @escaping (Error) -> Void) {
        
    }
}
