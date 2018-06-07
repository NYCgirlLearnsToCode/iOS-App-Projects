//
//  GameBrain.h
//  TicTacToeObjC
//
//  Created by Lisa J on 5/16/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, GameStatus) {
    GameStatus_Tie,
    GameStatus_PlayerOneWins,
    GameStatus_PlayerTwoWins,
    GameStatus_InProgressPlayerOneTurn,
    GameStatus_InProgressPlayerTwoTurn,
    GameStatus_InvalidMove
};

@interface GameBrain : NSObject

@property (strong,nonatomic) NSMutableArray *gameBoard;
@property (assign) BOOL isPlayerOnesTurn;

-(GameStatus) makeMoveAtX:(int) x andY: (int) y;

@end
