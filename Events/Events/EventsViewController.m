//
//  ViewController.m
//  Events
//
//  Created by Lisa J on 5/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import "EventsViewController.h"
#import "Event.h"
//#import "EventService.h"
#import "MeetupAPIService.h"
#import "EventCell.h"

@interface EventsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) NSArray <Event *> *events;
@property (nonatomic) MeetupAPIService *meetupAPIService;
@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _meetupAPIService = [[MeetupAPIService alloc] init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.searchBar.delegate = self;
    [self.tableView registerClass:EventCell.class forCellReuseIdentifier:@"EventCell"];
}

#pragma mark UITableView DataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EventCell *cell = (EventCell *)[tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
    Event *event = self.events[indexPath.row];
    [cell configureCellWithEvent:event];
    return cell;
}

#pragma mark UITableView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

#pragma mark UISearchBar Delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    
    NSString *encodedString = [searchBar.text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    [self.meetupAPIService searchEvent:encodedString completionHandler:^(NSError *error, NSArray *events) {
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.events = events;
                [self.tableView reloadData];
                self.navigationItem.title = [NSString stringWithFormat:@"Events (%ld)", self.events.count];
            });
        }
    }];
}

@end
