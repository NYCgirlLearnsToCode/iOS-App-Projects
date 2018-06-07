//
//  EventsTests.m
//  EventsTests
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Event.h"

@interface EventsTests : XCTestCase

@end

@implementation EventsTests

- (void)testCreatingEventModel {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"json"];
    if (path) {
        NSError *error;
        NSData *data = [NSData dataWithContentsOfFile:path];
        if (data) {
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (error) {
                XCTFail(@"error creating object: %@", error.localizedDescription);
            } else {
                NSMutableArray *events = [[NSMutableArray alloc] init];
                for (NSDictionary *dict in jsonArray) {
                    Event *event = [[Event alloc] initWithDict:dict];
                    [events addObject:event];
                }
                Event *firstEvent = (Event *)[events objectAtIndex:0];
                XCTAssertEqualObjects(firstEvent.eventId, @"250340886");
                XCTAssertEqualObjects(firstEvent.groupCreated, @1381892338000);
                XCTAssertEqualObjects(firstEvent.highResLink, @"https://secure.meetupstatic.com/photos/event/8/c/c/highres_295262252.jpeg");

                
                Event *nextEvent = (Event *)events[1];
                XCTAssertEqualObjects(nextEvent.eventCreated, @1524772225000);

                
                Event *lastEvent = (Event *)events.lastObject;
                XCTAssertEqualObjects(lastEvent.eventId, @"hzfzjlyxjbdb");
                XCTAssertEqualObjects(lastEvent.eventName, @"CocoaPods Peer Lab");
            }
        } else
            XCTFail(@"data is nil at path: %@", path);
    } else {
        XCTFail(@"file NOT FOUND at specifed path");
    }
}

@end
