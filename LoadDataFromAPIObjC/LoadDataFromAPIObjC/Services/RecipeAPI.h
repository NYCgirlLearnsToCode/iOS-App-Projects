//
//  RecipeAPI.h
//  LoadDataFromAPIObjC
//
//  Created by Lisa J on 5/25/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import "Recipe.h"

@interface RecipeAPI: NSObject

+ (void)loadData completionHandler: (void(^)(NSError *error, NSArray<Recipe *> *recipes))completion;

@end
