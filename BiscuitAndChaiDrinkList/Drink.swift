//
//  Drink.swift
//  BiscuitAndChaiDrinkList
//
//  Created by Lisa J on 11/22/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
struct DrinkList: Codable {
    let drink : DrinkWrapper
}
struct DrinkWrapper: Codable {
    let id: String
    let Name: String
    let SpecialItems: String
    let NumOfIngredients: String
    let Ingredients: String
    let Recipe: String
    let Image: String
    let Description: String
    let DrinkType: String
    let Cost: String
}
