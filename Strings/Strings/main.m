//
//  main.m
//  Strings
//
//  Created by Lisa J on 5/8/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//       let company = "" immutable
        NSString *company = @"Coalition For Queens";
        NSLog(@"%@", company);//@ specifies objects
        NSLog(@"Hello, World!");
        
        //var portfolio = ""
        //mutable string
        NSMutableString *portfolio = [[NSMutableString alloc] init];
        //allocate enough memory for what you are creating
        
        //portfolio.funcationName() //swift
        [portfolio appendString:@"AAPL AMZN YAHOO"];
        [portfolio appendString:@"TSLA"];
        NSLog(@"stock potfolio is %@", portfolio);
        
        //getting the length of a string
        NSUInteger len = portfolio.length;
        //method is []
        //property is . syntax
        NSLog(@"%lu", (unsigned long)len);
        
        
        NSString *string = @"Swift Rules";
        NSString *string12 = @"SWIFT RULES";
        
        //compare strings
        NSComparisonResult result = [string caseInsensitiveCompare:string12];
        
        if (result == NSOrderedSame) {
            NSLog(@"case Insensitive compare is the same");
        } else {
            NSLog(@"case Insensitive compare is NOT the same");
        }
        
        //unicode explicit compare use isEqual
        //YES or NO is returned
        BOOL isTheSame = [string isEqualToString:string12];
        if (isTheSame) {
            NSLog(@"isEqualToString is the same");
        } else {
            NSLog(@"isEqualToString is NOT the same");
        }
        
        //Write to a file
        NSString *fileName = @"/Users/lisaj/Desktop/bio.txt";
        NSString *bio = @"Secret mission at Coalition for Queens...";
        NSError *error;//no memory allocated to it, atomically yes write everything at once, if error point back and give me error, returns bool value
        BOOL writeSuceeded = [bio writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (writeSuceeded) {
            NSLog(@"File was written");
        } else {
            NSLog(@"File written error: %@", error.localizedDescription);
        }
        //Read to a file
        NSError *errorReadingFile;
        NSString *contentsOfFile = [[NSString alloc]
                                    initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:&errorReadingFile];
        if (!errorReadingFile) {
            NSLog(@"Contents of file found %@",contentsOfFile);
        } else {
            NSLog(@"reading error: %@", errorReadingFile.localizedDescription);
        }
        
        //search for substring
        NSString *keyword = @"mission";
        BOOL didFindSubstring = [contentsOfFile containsString:@"mission"];
        if (didFindSubstring) {
            NSLog(@"found substring %@", keyword);
        } else {
            NSLog(@"substring NOT found");
        }
        
    }
    return 0;
}
