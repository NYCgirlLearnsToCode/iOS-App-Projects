//
//  GOTEpisode.swift
//  ParsonJSONGOTCodeable
//
//  Created by Lisa J on 11/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct GOTEpisode: Codable{
    let name: String
    let runtime: Int
    let summary: String
    let image: ImageWrapper
    let _links: LinkWrapper
}
struct ImageWrapper: Codable {//wrappers for going down levels
    let medium: String
    let original: String
}

struct LinkWrapper: Codable {
    let `self`: SelfWrapper
}
struct SelfWrapper: Codable {
    let href:String
}
