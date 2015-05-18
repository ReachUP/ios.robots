//
//  Drama.m
//  ObjC_Examples
//
//  Created by Mira on 3/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PillsPack.h"

@implementation PillsPack

@synthesize delegate;


-(void) putPill: (NSString *) pill {
    [delegate push:pill];
}

-(NSString *) getPill {
    return [delegate pop];
}

@end
