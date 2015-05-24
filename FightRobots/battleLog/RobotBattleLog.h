//
//  RobotBattleLog.h
//  FightRobots
//
//  Created by Dobrin Dobrev on 5/22/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "BattleLog.h"

@interface RobotBattleLog : BattleLog

-(NSArray*) getDefenderEntries:(Robot*) defender;
-(NSArray*) getAttackerEntries:(Robot*) attacker;

@end
