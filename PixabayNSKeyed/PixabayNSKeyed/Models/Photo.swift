//
//  Photo.swift
//  PixabayNSKeyed
//
//  Created by Lisa J on 12/12/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    let hits: [Photos]
}

struct Photos: Codable {
    let tags: String
    let previewURL: String
    let webformatURL: String
}
