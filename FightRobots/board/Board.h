//
//  Board.h
//  FightRobots
//
//  Created by Mira on 5/16/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

@interface Board : NSObject {
    NSMutableArray *_robots;
    int _currentRobotIndex;
}

@property (atomic, readonly) int currentRobotIndex;
@property (atomic, readonly) NSMutableArray * robots;

+(Board *) sharedInstance;

-(void) turnLeft;
-(void) turnRight;
-(void) move;

-(void) addRobot:(Robot*) robot;
-(void) next;
-(void) previous;

@end
