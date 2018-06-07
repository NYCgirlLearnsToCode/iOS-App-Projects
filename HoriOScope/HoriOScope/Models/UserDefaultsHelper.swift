//
//  UserDefaultsHelper.swift
//  HoriOScope
//
//  Created by Lisa J on 12/11/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

//wrapper for user defaults
struct UserDefaultsHelper {
    static let manager = UserDefaultsHelper()
    private init() {}
    private let nameKey = "name"
    private let signKey = "sign"
    func getName() -> String? {
        
        return UserDefaults.standard.string(forKey: nameKey)
        
    }
    
    func getSign() -> String? {
        
        return UserDefaults.standard.string(forKey: signKey)
        
    }
    
    func setName(to newName: String) {
        
        UserDefaults.standard.setValue(newName, forKey: nameKey)
        
    }
    
    func setSign(to newSign: String) {
        
        UserDefaults.standard.setValue(newSign, forKey: signKey)
        
    }
}
