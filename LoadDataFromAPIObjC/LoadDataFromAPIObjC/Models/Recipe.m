//
//  Recipe.m
//  LoadDataFromAPIObjC
//
//  Created by Lisa J on 5/24/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipe.h"

@interface Recipe()
@end

@implementation Recipe
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        if(dict[@"title"]) {
            _title = dict[@"title"];
        } else {
            _title = @"No title available";
        }
        //href
        if (dict[@"href"]) {
            _href = dict[@"href"];
        } else {
            _href = @"No href available";
        }
        //ingredients
        if (dict[@"ingredients"]){
            _ingredients = dict[@"ingredients"];
        } else {
            _ingredients = @"No ingredients available";
        }
        //thumbnail
        if (dict[@"thumbnail"]) {
            _thumbnail = dict[@"thumbnail"];
        } else {
            _thumbnail = @"no thumbnail available";
        }
    }
    return self;
}
@end
