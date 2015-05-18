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


@interface Robot : NSObject<Comparable> {
@private
    Point2D * _position;
    Direction faces; 
}

@property (atomic, readonly) Point2D* position;
@property (atomic, readonly) Direction faces;

@property (atomic, readwrite) int maxStrenth;
@property (atomic, readonly) int life;

-(id) init;
-(void) move;
-(void) turnLeft;
-(void) turnRight;

-(bool) isDead;

+(int) getStepSize;
+(void) fight:(Robot*) attacker with:(Robot*) defender;

@end
