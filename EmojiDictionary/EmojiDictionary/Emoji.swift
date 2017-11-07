//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Lisa J on 10/31/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
class Emoji {
    
    var symbol: String
    var name: String
    var description: String
    var usage: String
    init(symbol:String, name:String, description:String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
        
    }
}
