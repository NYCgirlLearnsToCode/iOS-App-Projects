//
//  NetworkHelper.m
//  LoadDataFromAPIObjC
//
//  Created by Lisa J on 5/24/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkHelper.h"

//class extension
@interface NetworkHelper()
//private properties & methods
@property (nonatomic) NSURLSession *urlSession;
@end

@implementation NetworkHelper

+(instancetype)sharedManager {
    static NetworkHelper *networkHelper;
    static dispatch_once_t once_token;
    //ensures there's only one instance
    dispatch_once(&once_token, ^ {
        networkHelper = [[NetworkHelper alloc] init];
    });
    return networkHelper;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //initialize properties
        _urlSession = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
    }
    return self;
}

- (void)performRequestWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSError *, NSData *))completion {
    NSURLSessionDataTask *dataTask = [self.urlSession
                                      dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                          if (error) {
                                              completion(error,nil);
                                          } else {
                                              completion(nil,data);
                                          }
                                      }];
    [dataTask resume];
}

@end
