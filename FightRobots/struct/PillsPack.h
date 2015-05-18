//
//  Drama.h
//  ObjC_Examples
//
//  Created by Mira on 3/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structure.h"

@interface PillsPack : NSObject {

}

@property (assign, atomic, readwrite) id<Structure> delegate;

-(void) putPill: (NSString *) pill;
-(NSString *) getPill;



@end
