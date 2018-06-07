//
//  PlayData.swift
//  PlaysProjectUnitTesting
//
//  Created by Lisa J on 2/12/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

class PlayData {
    var allWords = [String]()
    //var wordCounts = [String: Int]()
    var wordCounts: NSCountedSet!
    private(set) var filteredWords = [String]() // can only be accessed within class
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter{$0 != ""}
                wordCounts = NSCountedSet(array: allWords)
                let sorted = wordCounts.allObjects.sorted{wordCounts.count(for: $0) > wordCounts.count(for: $1)}
                allWords = sorted as! [String]
                filteredWords = allWords
                applyUserFilter("swift")
//                for word in allWords {
//                    if wordCounts[word] == nil {
//                        wordCounts[word] = 1
//                    } else {
//                        wordCounts[word]! += 1
//                    }
//                }
//                allWords = Array(wordCounts.keys) //generating array with unique keys
            }
        }
            
    }
    func applyUserFilter(_ input: String) {
        if let userNumber = Int(input) {
            //we have a number
            applyFilter{ self.wordCounts.count(for: $0) >= userNumber }
        } else {
            //we have a string
            applyFilter{ $0.range(of: input, options: .caseInsensitive) != nil }
        }
    }
    
    func applyFilter(_ filter: (String)-> Bool) {
        filteredWords = allWords.filter(filter)
    }
}
