//
//  Stack.m
//  FightRobots
//
//  Created by Mira on 5/16/15.
//  Copyright (c) 2015 Mira. All rights reserved.
//

#import "Stack.h"

@implementation Stack

-(id) init {
    if (self = [super init]) {
        array = [NSMutableArray new];
    }
    return self;
}

+(id) makeEmpty {
    return [[Stack alloc] init];
}

-(id) pop {
    if ([array count] == 0) {
        return nil;
    }
    id header = [self top];
    if (header != nil) {
        [array removeObjectAtIndex:[array count]-1];
    }
    
    return header;
}

-(id) top {
    if ([array count] == 0) {
        return nil;
    }
    return [array objectAtIndex:[array count]-1];
}

-(void) push: (id) obj {
    [array addObject:obj];
}

@end
