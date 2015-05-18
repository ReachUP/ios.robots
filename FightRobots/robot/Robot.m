//
//  Robot.m
//  ObjC_Examples
//
//  Created by Mira on 3/10/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import "Robot.h"
#include <stdlib.h>

int dx[4] = {0, 1, 0, -1};
int dy[4] = {1, 0, -1, 0};

int const LIFE_DEDUCTION = 5;

@implementation Robot

@synthesize position = _position, faces = _faces, life = _life, maxStrenth = _maxStrenth;

+(void) initialize {
    NSLog(@"At initialize for class : %@", [self class]);
}

+(void) fight:(Robot *)attacker with:(Robot *)defender {
    int attackStrenth = arc4random_uniform(attacker.maxStrenth);
    int defenceStrenth = arc4random_uniform(defender.maxStrenth);
    
    int result = defenceStrenth - attackStrenth;
    if (result > 0) {
        attacker->_life -= LIFE_DEDUCTION;
    } else if (result < -5) {
        defender->_life -= LIFE_DEDUCTION;
    } else {
        defender->_life -= LIFE_DEDUCTION / 2;
        attacker->_life -= LIFE_DEDUCTION / 2;
    }
}

-(id) init {
    if ([super init]) {
        _position = [Point2D new];
        _faces = NORTH;
        _life = 10;
        _maxStrenth = 20;
    }
    return self;
}

-(void) move {
    (self->_position).x +=  [Robot getStepSize] * dx[faces];
    (self->_position).y +=  [Robot getStepSize] * dy[faces];
}

-(void) turnLeft {
    faces = [DirectionHelper left: faces];
}

-(void) turnRight {
    faces = [DirectionHelper right: faces];
}

-(bool) isDead {
    return (_life <= 0);
}

-(NSString *) description {
    return [NSString stringWithFormat: @"I am at %@, facing %@", [_position description], [DirectionHelper describe: faces]];
}

+(int) getStepSize {
    return 1;
}

-(int) compare:(id)other {
    if (![other isKindOfClass: [Robot class]]) {
            @throw [NSException exceptionWithName:@"Can not compare" reason: @"The argumnt is not valid robot type" userInfo: nil];
    }
    
    return ([self.position compare:[(Robot *)other position]]);
}

@end
