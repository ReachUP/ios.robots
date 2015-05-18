//
//  Direction.m
//  ObjC_Examples
//
//  Created by Mira on 3/10/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import "Direction.h"

@implementation DirectionHelper

+(Direction) left: (Direction) direction {
    return (direction + 3) % 4;
}

+(Direction) right: (Direction) direction {
    return (direction + 1) % 4;
}

+(NSString *) describe: (Direction) direction {
    switch (direction) {
        case NORTH : return @"North";
        case EAST : return @"East";
        case SOUTH : return @"South";
        case WEST : return @"West";
    }
    
    NSNumber * n = [[NSNumber alloc] initWithFloat:1.0];
    
    NSLog(@"Bla %@", n);
}


@end
