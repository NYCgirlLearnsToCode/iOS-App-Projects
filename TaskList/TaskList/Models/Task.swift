//
//  Task.swift
//  TaskList
//
//  Created by Lisa J on 1/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct Task : Codable{
    let name: String
    let status: String
    let estimatedTime: Int
    let rating: Double
    //let arr: [String] = ["test", "testing"]
    //Will convert into dict where keys are indicies
    func toJSON() -> Any {
        let jsonData = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: [])
    }
}
