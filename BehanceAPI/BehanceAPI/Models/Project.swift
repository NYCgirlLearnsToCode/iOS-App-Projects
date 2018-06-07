//
//  Project.swift
//  BehanceAPI
//
//  Created by Lisa J on 12/18/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
struct Project: Codable {
    let title: String
    static let testProjects = [
    Project(title: "testing")
    ]
}
//struct Project: Codable {
//    let projects: [ProjectInfo]
//}
//
//struct ProjectInfo: Codable {
//    let name: String
//    let covers: CoverWrapper
//}
//
//struct CoverWrapper: Codable {
//    let image: String
//
//    enum CodingKeys: String, CodingKey {
//        case image = "202"
//    }
//}

