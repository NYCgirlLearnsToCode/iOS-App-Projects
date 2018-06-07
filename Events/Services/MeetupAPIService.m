//
//  MeetupAPIService.m
//  Events
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeetupAPIService.h"
#import "Event.h"
#import "NetworkHelper.h"

#define APIKEY @"API KEY HERE"

@implementation MeetupAPIService

- (void)searchEvent:(NSString *)keyword completionHandler:(void (^)(NSError *, NSArray *))completion {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.meetup.com/find/events?key=%@&fields=group_photo&text=%@&lat=40.72&lon=-73.84", APIKEY, keyword]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NetworkHelper sharedManager] performRequestWithRequest:request completionHandler:^(NSError *error, NSData *data) {
        if (error) {
            completion(error, nil);
        } else {
            NSError *error;
            if (data) {
                NSMutableArray <Event *> *events = [[NSMutableArray alloc] init];
                NSArray *jsonObjects = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                if (error) {
                    completion(error, nil);
                } else {
                    for (NSDictionary *dict in jsonObjects) {
                        Event *event = [[Event alloc] initWithDict:dict];
                        [events addObject:event];
                    }
                    completion(nil, events);
                }
            } else {
                completion(error, nil);
            }
        }
    }];
}

@end
