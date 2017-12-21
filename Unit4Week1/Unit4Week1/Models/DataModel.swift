//
//  DataModel.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/21/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
class DataModel: Codable {
    private init(){}
    static let shared = DataModel()
    static var selectedPickerRow: Int {
        return UserDefaults.standard.integer(forKey: "SelectedRow")
    }
    static var selectedsetting: String {
        if UserDefaults.standard.string(forKey: "SelectedSetting") != nil {
            return UserDefaults.standard.string(forKey: "SelectedSetting")!
        } else {
            return "user default string is not working"
        }
    }
}
