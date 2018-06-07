//
//  ViewController.m
//  TicTacToeObjC
//
//  Created by Lisa J on 5/14/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: UIColor.cyanColor];
    [self allocInitViews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)allocInitViews {
    _gameStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
}

-(void) setUpGamesStackView {
    for (int i = 0; i < 9; i += 3) {
        [self.gameStackView addArrangedSubview[self.makeButtonStartingWith]]
    }
}


-(UIStackView*)makeButtonStackViewStartingWith:(int) val {
    UIStackView *sv = [[UIStackView alloc] init];
    [sv setAxis:UILayoutConstraintAxisHorizontal];
    [sv setDistribution:UIStackViewDistributionFillEqually];
    for (int i = val; i < val + 3; i++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"-" forState:UIControlStateNormal];
        [button setTag:i];
        [button addTarget:self action:@selector(handleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [sv addArrangedSubview:button];
    }
    return sv;
}

-(void)handleButtonPress: (UIButton*) button{
    NSLog(@"The tag is %ld",(long)button.tag);
}

@end
