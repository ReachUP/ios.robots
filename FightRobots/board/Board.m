//
//  Board.m
//  FightRobots
//
//  Created by Mira on 5/16/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "Board.h"
#import "Battle.h"
#import "BattleLogEntry.h"

@implementation Board(Private)

-(Robot *) currentRobot {
    //[_robots objectAtIndex:currentRobotIndex];
    return _robots[_currentRobotIndex];
};

-(NSMutableArray*) performBattleForRobot:(Robot*) attacker {
    NSMutableArray * dead = [NSMutableArray array];
    
    for (Robot * defender in _robots) {
        // for (int i = 0; i< [robots count]; i++) {
        if (([attacker.position compare:defender.position] == 0) && (attacker != defender)) {
            
            Battle *battle = [[Battle alloc] initWithAttacker:attacker andDefender:defender];
            
            BattleResult result = [battle conduct];
            
            BattleLogEntry *battleLogEntry = [[BattleLogEntry alloc] initWithAttacker:attacker defender:defender result:result];
            [battleLog addLogEntry:battleLogEntry];
            [attacker addToLog:battleLogEntry];
            [defender addToLog:battleLogEntry];
            
            if ([defender isDead]) {
                [dead addObject:defender];
            }
            if ([attacker isDead]) {
                [dead addObject:attacker];
            }
            break;
        }
    }
    return dead;
}

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
    
    Robot * attacker = [self currentRobot];
    
    [attacker move];
    NSMutableArray * dead = [self performBattleForRobot:attacker];
    
    [_robots removeObjectsInArray:dead];
}

-(void) printState {
    NSLog(@"-----------------------------");
    NSLog(@"\nList of robots: %@", _robots);
    NSLog(@"\nCurrent robot: %@",_robots[_currentRobotIndex]);
    NSLog(@"-----------------------------");}

@end
