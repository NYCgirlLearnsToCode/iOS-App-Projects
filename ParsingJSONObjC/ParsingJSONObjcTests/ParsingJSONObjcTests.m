//
//  ParsingJSONObjcTests.m
//  ParsingJSONObjcTests
//
//  Created by Lisa J on 5/21/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface ParsingJSONObjcTests : XCTestCase

@end

@implementation ParsingJSONObjcTests

- (void)testReadingJSONFile{
    //getting the path in the current bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"json" inDirectory:nil];
    if (path) {
        //create data from that path
        NSData *jsonData = [NSData dataWithContentsOfFile:path];
        NSError *error;
        if (jsonData) {
            //convert data to dict object
            NSDictionary *dict = [NSJSONSerialization
                                  JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error: &error];
                                        //&error will change the value if there is an error (inout)
            if (error) {
                XCTFail("JSONSerialization error: %@", error.localizedDescription);
            } else {
                //create person object
                Person *person = [[Person alloc] initWithDict:dict];
                XCTAssertEqualObjects(person.name, @"Jane");
                XCTAssertEqualObjects(person.email, @"jane@jane.com");
                XCTAssertEqualObjects(person.phone, @"917-123-4567");
            }
        } else {
            //if data is nil
            XCTFail("JSONSerialization error: %@", error.localizedDescription);
        }
        
        XCTAssertNotNil(path);
    } else {
        XCTFail(@"file NOT found");
    }
}
@end
