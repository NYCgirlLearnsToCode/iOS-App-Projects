//
//  Task.swift
//  TaskListPractice
//
//  Created by Lisa J on 1/30/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct Task: Codable{
    let name: String
    let status: String
    func toJSON() -> Any {
        let jsonData = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: [])
    }
}
