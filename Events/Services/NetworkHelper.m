//
//  NetworkHelper.m
//  Events
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkHelper.h"


//class extension
@interface NetworkHelper ()
//private properties and methods
@property (nonatomic) NSURLSession *urlSession;
@end

@implementation NetworkHelper

//[NetworkHelper sharedManager]
+(instancetype)sharedManager {
    static NetworkHelper *networkHelper;
    dispatch_once_t once_token;
    dispatch_once(&once_token, ^ {//grand central dispatch tht ensures 1 instance
        networkHelper = [[NetworkHelper alloc] init];
    });
    return networkHelper;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        //initialize properties
        _urlSession = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
    }
    return self;
}

-(void)performRequestWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSError *, NSData *))completion {
    //dataTask
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(error, nil);
        } else {
            completion(nil, data);
        }
    }];
    [dataTask resume];
}

@end

