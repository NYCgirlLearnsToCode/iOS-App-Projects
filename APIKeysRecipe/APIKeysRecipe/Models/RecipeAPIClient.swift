//
//  RecipeAPIClient.swift
//  APIKeysRecipe
//
//  Created by Lisa J on 12/4/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class RecipeAPIClient {
    private init() {}
    static let manager = RecipeAPIClient()
    func getRecipes(named searchStr: String, completionHandler: @escaping ([Recipe]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let appID = "bbea51d0"
        let appKey = "4c6e3ee50666b14447398e74a7047a8a"
        let urlStr = "https://api.edamam.com/search?q=\(searchStr)&app_id=\(appID)&app_key=\(appKey)"
        guard let url = URL(string: urlStr) else {errorHandler(AppError.badURL);return}
        let completion: (Data) -> Void = {(data:Data) in //turns data into array of recipes
            do {
                    let recipeInfo = try JSONDecoder().decode(AllRecipeInfo.self, from: data)
                    let recipeWrappers = recipeInfo.hits
                let recipes = recipeWrappers.map({$0.recipe})
                completionHandler(recipes)
            }catch let error{
                errorHandler(AppError.codingError(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
