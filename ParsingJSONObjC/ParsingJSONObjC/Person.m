//
//  Person.m
//  ParsingJSONObjc
//
//  Created by Lisa J on 5/21/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

//empty m file

//Person *person = [[Person alloc] initWithDict:dict];
//NSLog(@"person.name"); output: Jane

@implementation Person

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];//super when doing initialization for house cleaning and updating values using the dict
    if (self) {
        if (dict[@"name"]) {
        _name = dict[@"name"];//key in json file
        }
        if (dict[@"email"]) {
            _email = dict[@"email"];//key in json file
        }
        if (dict[@"name"]) {
            _phone = dict[@"phone"];//key in json file
        }
        
    }
    return self;// return Person
}
-(void)personDescription {
    NSLog(@"name: %@ \n email: %@ \n phone: $@ \n", self.name, self.email, self.phone);
}
@end
