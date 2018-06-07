//
//  MeetupAPITest.m
//  EventsTests
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetworkHelper.h"
#define API_KEY @"77362a92073746e6228434233bc5b"

@interface MeetupAPITest : XCTestCase

@end

@implementation MeetupAPITest

//async test
-(void)testMeetupAPI {
    //    background test requirments
    XCTestExpectation *exp = [self expectationWithDescription:@"events found"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.meetup.com/find/events?key=%@&fields=group_photo&text=swift&lat=40.72&lon=-73.84", API_KEY]];
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NetworkHelper sharedManager]  performRequestWithRequest:request completionHandler:^(NSError *error, NSData *data) {
        if (error) {
            XCTFail(@"request failed with error: %@", error.localizedDescription);
        } else {
            [exp fulfill];
            XCTAssertNotNil(data);
        }
        
    }];
    
    // background test requirements
    [self waitForExpectations:@[exp] timeout:10.0];
}

@end
