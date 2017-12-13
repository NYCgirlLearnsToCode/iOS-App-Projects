//
//  Stock.swift
//  GettingDataFromOnline
//
//  Created by Lisa J on 11/27/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
struct Stock: Codable {
    let symbol: String
    let companyName: String
    let CEO: String
    let exchange: String
    let description: String
    static let defaultStock = Stock(symbol: "DEFAULT", companyName: "No company", CEO: "N/A", exchange: "no exchange", description: "no descrip")
}
