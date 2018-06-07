//
//  Movie.swift
//  MovieSearch
//
//  Created by Lisa J on 12/15/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let artworkUrl100: URL
    let artworkUrl160: URL
    let collectionName: String?
    let collectionId: Int?
    let trackId:Int
    let longDescription: String?
}

struct MovieResults: Codable {
    let results: [Movie]
}
