//
//  Weather.swift
//  OpenWeather
//
//  Created by Lisa J on 4/28/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let list: [WeatherWrapper]
}

struct WeatherWrapper: Codable {
    let dtTxt: String
    let main: MainInfo
    private enum CodingKeys: String, CodingKey {
        case dtTxt = "dt_txt"
        case main
    }
}

struct MainInfo: Codable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    let seaLevel: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
    }
}


