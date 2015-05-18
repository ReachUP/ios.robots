//
//  NSMutableArray+Queue.m
//  ObjC_Examples
//
//  Created by Mira on 3/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)

+(id) makeEmpty {
    return [NSMutableArray new];
}

-(id) pop {
    if ([self count] == 0) {
        return nil; 
    } 
    id header = [self top];
    if (header != nil) {
        [self removeObjectAtIndex:0];
    }
    return header;
}

-(id) top {
    if ([self count] == 0) {
        return nil; 
    } 
    return [self objectAtIndex:0];
}

-(void) push: (id) obj {
    [self addObject:obj];
}


@end
