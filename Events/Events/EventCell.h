//
//  EventCell.h
//  Events
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventCell : UITableViewCell
@property (nonatomic) UIImageView *eventImage;
- (void)configureCellWithEvent:(Event *)event;
@end
