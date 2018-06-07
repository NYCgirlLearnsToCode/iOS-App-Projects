//
//  ViewController.m
//  LoadDataFromAPIObjC
//
//  Created by Lisa J on 5/24/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import "ViewController.h"
#import "Recipe.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic)NSArray *recipes;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recipes.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recipeCell" forIndexPath:indexPath];
    Recipe *recipe = self.recipes[indexPath.row];
    cell.textLabel.text = recipe.title;
    return cell;
}



@end
