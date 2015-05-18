//
//  Direction.h
//  ObjC_Examples
//
//  Created by Mira on 3/10/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    NORTH,
    EAST,
    SOUTH,
    WEST
    
} Direction;

@interface DirectionHelper : NSObject 

+(Direction) left: (Direction) direction;
+(Direction) right: (Direction) direction;
+(NSString *) describe: (Direction) direction;

@end

