//
//  ImageCache.h
//  Events
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCache: NSObject

@property (nonatomic) NSCache *sharedCache;

+ (id)sharedManager;
- (UIImage *)getImageForKey:(NSString *)key;

@end
