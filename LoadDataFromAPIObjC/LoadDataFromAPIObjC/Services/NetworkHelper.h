//
//  NetworkHelper.h
//  LoadDataFromAPIObjC
//
//  Created by Lisa J on 5/24/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

@interface NetworkHelper: NSObject
//class method
+ (instancetype)sharedManager;
//instance method
- (void)performRequestWithRequest:(NSURLRequest *)request completionHandler:(void(^)(NSError *error, NSData *data))completion;
@end
