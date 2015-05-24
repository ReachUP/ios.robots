//
//  Robot.h
//  ObjC_Examples
//
//  Created by Mira on 3/10/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Point.h"
#import "Direction.h"
#import "Comparable.h"

@class RobotBattleLog;
@class BattleLogEntry;

@interface Robot : NSObject<Comparable> {
@private
    Point2D * _position;
    Direction faces;
    RobotBattleLog * battleLog;
}

@property (atomic, strong) Point2D* position;
@property (atomic) Direction faces;
@property (atomic, strong) NSString* name;
@property (atomic, strong) NSDate* dateCreated;

@property (atomic) int maxStrength;
@property (atomic) int life;

-(id) init;
-(void) move;
-(void) turnLeft;
-(void) turnRight;

-(void) takeDamage:(int) damage;
-(bool) isDead;

-(void) addToLog:(BattleLogEntry*) battleLogEntry;

+(int) getStepSize;

@end
