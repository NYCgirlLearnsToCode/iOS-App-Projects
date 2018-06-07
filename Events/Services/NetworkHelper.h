//
//  NetworkHelper.h
//  Events
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

@interface NetworkHelper: NSObject
//[NetworkHelper sharedManager]...
+ (instancetype)sharedManager;//class method
- (void)performRequestWithRequest: (NSURLRequest *)request completionHandler:(void(^)(NSError *error, NSData *data))completion;
@end
