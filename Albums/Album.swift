//
//  Album.swift
//  Albums
//
//  Created by Lisa J on 11/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct Album {
    let collectionName: String
    let artworkUrl100: String

    init(resultDict: [String : Any]) {
        collectionName = resultDict["collectionName"] as? String ?? ""
        artworkUrl100 = resultDict["artworkUrl100"] as? String ?? ""
    }
}
