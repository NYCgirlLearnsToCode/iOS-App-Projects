//
//  MeetupAPIService.h
//  Events
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//
@interface MeetupAPIService: NSObject

- (void)searchEvent:(NSString *)keyword completionHandler:(void(^)(NSError *error, NSArray *events))completion;

@end
