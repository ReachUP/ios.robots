//
//  BigFoot.m
//  ObjC_Examples
//
//  Created by Mira on 3/15/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "BigFoot.h"

// int big_dx[4] = {0, 2, 0, -2};
// int big_dy[4] = {2, 0, -2, 0}; 
@implementation BigFoot

-(void) move {
    [super move];
    [super move];
//    [super.position setX: ([super.position getX] + big_dx[super.faces])];
//    [self.position setY: ([super.position getY] + big_dy[super.faces])];
}

+(int) getStepSize {
    return (2 * [super getStepSize]);
    // return 2;
}
    
@end
