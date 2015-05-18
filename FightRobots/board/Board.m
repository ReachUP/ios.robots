//
//  Board.m
//  FightRobots
//
//  Created by Mira on 5/16/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "Board.h"

@implementation Board(Private)

-(Robot *) currentRobot {
    //[_robots objectAtIndex:currentRobotIndex];
    return _robots[_currentRobotIndex];
};

@end

@implementation Board

@synthesize robots = _robots, currentRobotIndex = _currentRobotIndex;

static Board *sharedSingleton;

+ (void)initialize {
    if (!sharedSingleton) {
        sharedSingleton = [[Board alloc] init];
    }
}

+ (Board *) sharedInstance {
    return sharedSingleton;
}

-(id) init {
    if (sharedSingleton) {
        @throw [NSException exceptionWithName: @"Can not instantiate"
                                       reason: @"This method is not allowed"
                                     userInfo: nil];
    }
    if (self = [super init]) {
        _robots = [NSMutableArray array];
        _currentRobotIndex = 0;
    }
    return self;
}

-(void) addRobot:(Robot*) robot {
    [_robots addObject:robot];
}

-(void) previous {
    if (_currentRobotIndex > 0)
        _currentRobotIndex--;
}

-(void) next {
    if (_currentRobotIndex < [_robots count]-1) {
        _currentRobotIndex++;
    }
}

-(void) turnLeft {
    [[self currentRobot] turnLeft];
}

-(void) turnRight {
    [[self currentRobot] turnRight];
}

-(void) move {
    [[self currentRobot] move];
    
    Robot * attacker = [self currentRobot];
    NSMutableArray * dead = [NSMutableArray array];
    
    for (Robot * defender in _robots) {
 // for (int i = 0; i< [robots count]; i++) {
        if ([attacker.position compare:defender.position] == 0) {
            [Robot fight:attacker with:defender];
            if ([defender isDead]) {
                [dead addObject:defender];
            }
            if ([attacker isDead]) {
                [dead addObject:attacker];
                break;
            }
        }
    }
    [_robots removeObjectsInArray:dead];
}

@end
