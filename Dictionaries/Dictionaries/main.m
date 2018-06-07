//
//  main.m
//  Dictionaries
//
//  Created by Lisa J on 5/8/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSDictionary *triathalon = @{@"Sprint":@"Swim 400m, Bike: 12miles, Run:3.1miles",
            @"Olympic":@"Swim 500m, Bike: 15miles, Run:4.1miles",
            @"Half":@"Swim 250m, Bike: 8miles, Run:2miles",
            @"Full":@"Swim 2miles, Bike: 112miles, Run:8miles"};
        //Enumerat dictionary
        for (NSString *key in triathalon) {
            NSLog(@"A %@ distnace triathlon is %@", key, triathalon[key]);
        }
        //to get only keys or only values in dictionary
        NSArray *allkeys = triathalon.allKeys;
        NSArray *allValues = triathalon.allValues;
    }
    return 0;
}
