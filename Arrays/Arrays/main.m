//
//  main.m
//  Arrays
//
//  Created by Lisa J on 5/8/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSArray *marathons = @[@"New York", @"Stockholm", @"Chicago"];
        //iterate collection
        for (NSString *marathon in marathons) {
            NSLog(@"I have done this marathon: %@", marathon);
        }
        //Mutable arrs
        NSMutableArray *programmingLanguages = [[NSMutableArray alloc]init];
        [programmingLanguages addObject:@"C"];
        [programmingLanguages addObject:@"Java"];
        [programmingLanguages addObject:@"C++"];
        [programmingLanguages addObject:@"JavaScript"];
        [programmingLanguages addObject:@"PHP"];
        for(NSString *language in programmingLanguages) {
            NSLog(@"language is %@", language);
        }
        //Remove object from array
        [programmingLanguages removeObject:@"PHP"];
        NSLog(@"languages %@:", programmingLanguages);
        
        BOOL *languageFound = [programmingLanguages containsObject:@"C"];
        if (languageFound) {
            NSLog(@"language FOUND");
        } else {
            NSLog(@"language NOT FOUND");
        }
        
        //multi dimensional array
        NSArray *multiDimensionArray = @[@[@3, @9],
                                         @[@67, @33]];
        //nsnumber syntax @3, @4
        //id is of type any
        for (id innerArray in multiDimensionArray) {
            for (NSNumber *num in innerArray) {
                NSLog(@"num is %@", num);
            }
        }
    }
    return 0;
}
