//
//  BattleLog.m
//  FightRobots
//
//  Created by Dobrin Dobrev on 5/22/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "BattleLog.h"

@implementation BattleLog

@synthesize logEntries = _logEntries;

-(void) addLogEntry:(BattleLogEntry *)logEntry {
    [_logEntries addObject:logEntry];
}

@end
