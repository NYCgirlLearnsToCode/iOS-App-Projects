//
//  GameBrain.m
//  TicTacToeObjC
//
//  Created by Lisa J on 5/16/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import "GameBrain.h"

@implementation GameBrain

-(id) init {
    self = [super init];
    if (self) {
        _isPlayerOnesTurn = YES;
        _gameBoard = [[NSMutableArray alloc] initWithArray:@[
                                                             [[NSMutableArray alloc] initWithArray:@[@0, @0, @0]],
                                                                                                                          [[NSMutableArray alloc] initWithArray:@[@0, @0, @0]],
                                                                                                                          [[NSMutableArray alloc] initWithArray:@[@0, @0, @0]]
                                                             
                                                             ]
                      ];
    }
    return self;
}

- (GameStatus)makeMoveAtX:(int)x andY:(int)y {
    if (x < 0 || y < 0 || x > 2 || y > 2) {
        return GameStatus_InvalidMove;
    }
    if(!([self.gameBoard[x][y] isEqual: @0])) {
        return GameStatus_InvalidMove;
    }
    //Make Move
}

@end
