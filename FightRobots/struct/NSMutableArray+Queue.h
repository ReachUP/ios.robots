//
//  NSMutableArray+Queue.h
//  ObjC_Examples
//
//  Created by Mira on 3/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structure.h"

@interface NSMutableArray (Queue) <Structure>

+(id) makeEmpty;

-(id) pop;
-(id) top;
-(void) push: (id) obj; 

@end
