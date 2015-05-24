//
//  BattleLog.h
//  FightRobots
//
//  Created by Dobrin Dobrev on 5/22/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BattleLogEntry.h"

@interface BattleLog : NSObject {
    
}

@property (atomic, retain) NSMutableArray* logEntries;

-(void) addLogEntry: (BattleLogEntry*)logEntry;

@end
