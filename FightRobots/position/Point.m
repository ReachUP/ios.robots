//
//  Point.m
//  ObjC_Examples
//
//  Created by Mira on 3/10/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import "Point.h"

@implementation Point2D

@synthesize x,y;

-(id) initWithX:(int) _x andY: (int) _y {
    if (self = [super init]) {
        self.x = _x;
        self.y = _y;
    }
    return self;
}

-(int) compare:(id)other {
    if (![other isKindOfClass: [Point2D class]]) {
        @throw [NSException exceptionWithName:@"Can not compare" reason: @"The argumnt is not valid point type" userInfo: nil];
    }
    
    return ([self distanceFromBegin] - [(Point2D *)other distanceFromBegin]);
}
-(int) distanceFromBegin {
    int result = (abs(self.x) + abs(self.y));
    NSLog(@"I am %@ and distance is %d", self, result);
    return result;
}

-(NSString *) description {
    return [NSString stringWithFormat: @"Point[%d, %d]", self.x, self.y];
}


+(Point2D *) makePointWithX:(int) x andY: (int) y {
    return [[Point2D alloc] initWithX: x andY: y];
}

+(Point2D *) new {
    return [Point2D makePointWithX:0 andY:0];
}

@end
