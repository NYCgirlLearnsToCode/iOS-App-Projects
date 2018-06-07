//
//  Search.swift
//  CatOrDog
//
//  Created by Lisa J on 12/19/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id: String
    let title: String
    let url_m: String
}

struct Results: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
    let photo: [Photo] //array of photos from JSON data
}

struct Search: Codable {
    let photos: Results
}
