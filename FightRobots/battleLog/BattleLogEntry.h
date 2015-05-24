//
//  LogEntry.h
//  FightRobots
//
//  Created by Dobrin Dobrev on 5/22/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Battle.h"

#import "Robot.h"

@interface BattleLogEntry : NSObject

@property (atomic, retain) Robot* attacker;
@property (atomic, retain) Robot* defender;
@property (atomic, readonly) BattleResult result;

+(BattleLogEntry*)logEntryWithAttacker:(Robot*) attacker defender:(Robot*) defender result:(BattleResult) result;
-(id)initWithAttacker:(Robot*) attacker defender:(Robot*)defender result:(BattleResult) result;

@end
