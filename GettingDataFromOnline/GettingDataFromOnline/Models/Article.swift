//
//  Article.swift
//  GettingDataFromOnline
//
//  Created by Lisa J on 11/27/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct Article: Codable {
    let datetime: String
    let headline: String
    let source: String
    let summary: String
    let related: String
}
