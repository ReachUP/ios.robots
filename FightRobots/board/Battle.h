//
//  Battle.h
//  FightRobots
//
//  Created by Dobrin Dobrev on 5/22/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Robot.h"
typedef enum {
    ATTACKER_WON,
    DEFENDER_WON,
    DRAW
} BattleResult;

@interface Battle : NSObject {
    
}

@property (atomic, strong) Robot* attacker;
@property (atomic, strong) Robot* defender;

-(id) initWithAttacker:(Robot*) attacker andDefender:(Robot*) defender;
-(BattleResult) conduct;


@end
