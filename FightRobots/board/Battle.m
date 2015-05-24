//
//  Battle.m
//  FightRobots
//
//  Created by Dobrin Dobrev on 5/22/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "Battle.h"

@implementation Battle

int const LIFE_DEDUCTION = 5;

@synthesize attacker = _attacker, defender = _defender;

-(id) initWithAttacker:(Robot*) attacker andDefender:(Robot*) defender {

    if (self = [super init]) {
        _attacker = attacker;
        _defender = defender;
    }
    
    return self;
}

-(BattleResult) conduct {
    NSLog(@"\nDEFENDER: %@\nATTACKER: %@", _defender, _attacker);
    int attackStrength = arc4random_uniform(_attacker.maxStrength);
    int defenceStrength = arc4random_uniform(_defender.maxStrength);
    
    int result = defenceStrength - attackStrength;
    BattleResult battleResult = DRAW;
    
    if (result > 0) {
        [_attacker takeDamage:LIFE_DEDUCTION];
        battleResult = DEFENDER_WON;
        NSLog(@"%@ won!", [_defender name]);
    } else if (result < -5) {
        [_defender takeDamage:LIFE_DEDUCTION];
        battleResult = ATTACKER_WON;
        NSLog(@"%@ won!", [_attacker name]);
    } else {
        [_defender takeDamage:LIFE_DEDUCTION / 2];
        [_attacker takeDamage:LIFE_DEDUCTION / 2];
        battleResult = DRAW;
        NSLog(@"Battle ended in a draw!");
    }
    
    if ([_attacker isDead]) {
        NSLog(@"%@ died!", [_attacker name]);
    }
    
    if ([_defender isDead]) {
        NSLog(@"%@ died!", [_defender name]);
    }
    
    return battleResult;
}

@end
