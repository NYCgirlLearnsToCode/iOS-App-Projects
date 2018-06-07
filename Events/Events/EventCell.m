//
//  EventCell.m
//  Events
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import "EventCell.h"
#import "ImageCache.h"

@interface EventCell ()
@property (nonatomic) UILabel *eventDate;
@property (nonatomic) UILabel *eventName;
@property (nonatomic) UILabel *groupName;
@property (nonatomic) UILabel *localDate;
@end

@implementation EventCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"EventCell"];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)configureCellWithEvent:(Event *)event {
    self.localDate.text = event.localDate;
    self.eventName.text = event.eventName;
    self.groupName.text = event.groupName;
    UIImage *image = [[ImageCache sharedManager] getImageForKey:event.highResLink];
    if (image)
        self.eventImage.image = image;
    else
        self.eventImage.image = [UIImage imageNamed:@"placeholder-image"];
}

- (void)setupViews {
    [self setupImageView];
    [self setupLocalDate];
    [self setupEventName];
    [self setupGroupName];
}

- (void)setupImageView {
    if (!_eventImage)
        _eventImage = [[UIImageView alloc] init];
    [self addSubview:self.eventImage];
    self.eventImage.contentMode = UIViewContentModeScaleAspectFill;
    self.eventImage.clipsToBounds = YES;
    self.eventImage.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.eventImage.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.eventImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.eventImage.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
                                              [self.eventImage.widthAnchor constraintEqualToAnchor:self.heightAnchor]
                                              ]];
}

- (void)setupLocalDate {
    if (!_localDate)
        _localDate = [[UILabel alloc] init];
    [self addSubview:self.localDate];
    self.localDate.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
    self.localDate.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.localDate.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.localDate.leadingAnchor constraintEqualToAnchor:self.eventImage.trailingAnchor constant: 10]
                                              ]];
}

- (void)setupEventName {
    if (!_eventName)
        _eventName = [[UILabel alloc] init];
    [self addSubview:self.eventName];
    self.eventName.numberOfLines = 0;
    self.eventName.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.eventName.leadingAnchor constraintEqualToAnchor:self.eventImage.trailingAnchor constant: 10],
                                              [self.eventName.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant: -10],
                                              [self.eventName.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
                                              ]];
}

- (void)setupGroupName {
    if (!_groupName)
        _groupName = [[UILabel alloc] init];
    [self addSubview:self.groupName];
    self.groupName.numberOfLines = 1;
    self.groupName.font = [UIFont systemFontOfSize:12 weight:UIFontWeightThin];
    self.groupName.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.groupName.leadingAnchor constraintEqualToAnchor:self.eventImage.trailingAnchor constant: 10],
                                              [self.groupName.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant: -10],
                                              [self.groupName.topAnchor constraintEqualToAnchor:self.eventName.bottomAnchor constant: 10]
                                              ]];
}

@end
