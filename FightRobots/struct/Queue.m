//
//  Queue.m
//  ObjC_Examples
//
//  Created by Mira on 3/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Queue.h"

@implementation Queue

-(id) init {
    if (self = [super init]) {
        array = [NSMutableArray new];
    }
    return self;
}

+(id) makeEmpty {
    return [[Queue alloc] init];
}

-(id) pop {
    if ([array count] == 0) {
        return nil; 
    } 
    id header = [self top];
    if (header != nil) {
        [array removeObjectAtIndex:0];
    }
    
    return header;
}

-(id) top {
    if ([array count] == 0) {
        return nil; 
    } 
    return [array objectAtIndex:0];
}

-(void) push: (id) obj {
    [array addObject:obj];
}

@end
