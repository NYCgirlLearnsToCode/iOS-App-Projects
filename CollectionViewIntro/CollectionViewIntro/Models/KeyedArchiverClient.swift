//
//  KeyedArchiverClient.swift
//  CollectionViewIntro
//
//  Created by Lisa J on 12/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class KeyedArchiverClient {
    private init () {}
    static let manager = KeyedArchiverClient()
    static let pathName = "FavoriteCards.plist"
    private var cards = [Card](){
        didSet {
            saveCards()
        }
    }
    func add(card: Card) {
        cards.append(card)
    }
    private func dataFilePath(withPathName: String)-> URL {
        
    }
    
    func loadData() {
        let path = dataFilePath(withPathName: KeyedArchiverClient.pathName)
        do {
            let data = try Data(contentsOf: path)
            let cards = try PropertyListDecoder().decode([Card].self, from: data)
            self.cards = cards
        }catch {
            print(error)
        }
    }
    func saveCards() {
        let path = dataFilePath(withPathName: KeyedArchiverClient.pathName)
        do {
           let data = try PropertyListEncoder().encode(cards)
            try data.write(to: path, options: .atomic)
        } catch {
            print(error)
        }
    }
    
}
