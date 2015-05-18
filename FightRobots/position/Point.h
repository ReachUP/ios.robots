//
//  Point.h
//  ObjC_Examples
//
//  Created by Mira on 3/10/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comparable.h"

@interface Point2D : NSObject<Comparable> {
    // nothing
}

@property(atomic, readwrite) int x, y;

-(id) initWithX:(int) x andY: (int) y;
-(int) distanceFromBegin; // Manhatan distance

+(Point2D *) new;
+(Point2D *) makePointWithX:(int) _x andY: (int) _y;

@end
