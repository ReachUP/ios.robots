//
//  LogEntry.m
//  FightRobots
//
//  Created by Dobrin Dobrev on 5/22/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "BattleLogEntry.h"

@implementation BattleLogEntry

@synthesize attacker = _attacker, defender = _defender, result = _result;

+(BattleLogEntry*)logEntryWithAttacker:(Robot*) attacker defender:(Robot*) defender result:(BattleResult) result {
    return [[self alloc] initWithAttacker:attacker defender:defender result:result];
}

-(id)initWithAttacker:(Robot*) attacker defender:(Robot*)defender result:(BattleResult) result {
    if (self = [super init]) {
        _attacker = attacker;
        _defender = defender;
        _result = result;
    }
    
    return self;
}


@end
