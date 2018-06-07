//
//  Country.swift
//  ConcurrencyProjWithCountries
//
//  Created by Lisa J on 11/30/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

//struct Country: Codable {
//    let countryInfo: Country
//}
struct Country: Codable {
    let name: String
    let capital: String
    let population: Int
    let currencies: [CurrencyWrapper]
}
struct CurrencyWrapper: Codable {
    let code: String
    let name: String
}
