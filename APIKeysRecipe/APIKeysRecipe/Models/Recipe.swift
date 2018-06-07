//
//  Recipe.swift
//  APIKeysRecipe
//
//  Created by Lisa J on 12/4/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
struct AllRecipeInfo: Codable {
    let hits: [RecipeWrapper]
}

struct RecipeWrapper: Codable {
    let recipe: Recipe
}

struct Recipe: Codable {
    let name: String//here must match new key
    let image: String
    let source: String
    
    enum CodingKeys: String, CodingKey {
        case name = "label"// string is the orig, have to change above
        case image
        case source
        // have to also list cases of keys that we are not changing too
    }
}
