//
//  RobotBattleLog.m
//  FightRobots
//
//  Created by Dobrin Dobrev on 5/22/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "RobotBattleLog.h"

@implementation RobotBattleLog

-(NSArray*) getAttackerEntries:(Robot *)attacker {
    NSPredicate * attackersOnlyPredicate = [NSPredicate predicateWithFormat:@"SELF.attacker is %@", attacker];
    return [[self logEntries] filteredArrayUsingPredicate:attackersOnlyPredicate];
}

-(NSArray*) getDefenderEntries:(Robot *)defender {
    NSPredicate * defendersOnlyPredicate = [NSPredicate predicateWithFormat:@"SELF.defender is %@", defender];
    return [[self logEntries] filteredArrayUsingPredicate:defendersOnlyPredicate];
}

@end
