//
//  Robot.m
//  ObjC_Examples
//
//  Created by Mira on 3/10/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import "Robot.h"
#import "RobotBattleLog.h"
#import "BattleLogEntry.h"
#include <stdlib.h>

int dx[4] = {0, 1, 0, -1};
int dy[4] = {1, 0, -1, 0};


@implementation Robot

@synthesize position = _position, faces, life = _life, maxStrength = _maxStrength, name = _name, dateCreated = _dateCreated;

-(id) init {
    if ([super init]) {
        _position = [Point2D new];
        faces = NORTH;
        _life = 10;
        _maxStrength = 20;
        _name = @"";
        _dateCreated = [NSDate date];
        battleLog = [RobotBattleLog new];
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

-(void) takeDamage:(int)damage {
    _life -= damage;
}

-(NSString *) description {
    return [NSString stringWithFormat: @"%@(%i hp): I am at %@, facing %@", _name, _life, [_position description], [DirectionHelper describe: faces]];
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

-(void) addToLog:(BattleLogEntry*) battleLogEntry {
    [battleLog addLogEntry:battleLogEntry];
}

@end
