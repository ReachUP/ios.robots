//
//  Board.h
//  FightRobots
//
//  Created by Mira on 5/16/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Robot.h"
#import "BattleLog.h"

@interface Board : NSObject {
    NSMutableArray *_robots;
    BattleLog *battleLog;
    int _currentRobotIndex;
}

@property (atomic, readonly) int currentRobotIndex;
@property (atomic, readonly) NSMutableArray * robots;

+(Board *) sharedInstance;

-(void) turnLeft;
-(void) turnRight;
-(void) move;
-(void) next;
-(void) previous;

-(void) addRobot:(Robot*) robot;
-(void) printState;

@end
