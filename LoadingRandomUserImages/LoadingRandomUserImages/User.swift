//
//  User.swift
//  LoadingRandomUserImages
//
//  Created by Lisa J on 11/28/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct UserInfo: Codable {
    let results: [ResultsWrapper]
    
}

struct ResultsWrapper: Codable {
    let gender: String
    let dob: String
    let cell: String
    let picture: PictureWrapper
    let name: NameWrapper
    let location: LocationWrapper
}

struct NameWrapper: Codable {
    let title: String
    let first: String
    let last: String

}
struct LocationWrapper: Codable {
    let street: String
    let city: String
    let state: String
    //let postcode: String
}
struct PictureWrapper: Codable {
    let large: String?
    let medium: String?
    let thumbnail: String?
}
