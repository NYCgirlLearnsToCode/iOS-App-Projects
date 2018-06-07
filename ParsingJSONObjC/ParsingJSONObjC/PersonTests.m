//
//  PersonTests.m
//  ParsingJSONObjcTests
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

- (void)testPerson {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"json"];
    if (path) {
        NSError *error;
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        if (data) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            XCTAssertTrue([NSJSONSerialization isValidJSONObject:jsonDict]);
            if (error) {
                XCTFail(@"error creating object: %@", error.localizedDescription);
            } else {
                Person *me = [[Person alloc] initWithDict:jsonDict];
                
                XCTAssertEqualObjects(me.name, @"Jane");
                XCTAssertEqualObjects(me.email, @"jane@jane.com");
                XCTAssertEqualObjects(me.phone, @"917-123-4567");
            }
        } else
            XCTFail(@"data is nil at path: %@", path);
    } else {
        XCTFail(@"file NOT FOUND at specifed path");
    }
}

@end
