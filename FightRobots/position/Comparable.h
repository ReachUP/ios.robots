//
//  Comparable.h
//  ObjC_Examples
//
//  Created by Mira on 3/16/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Comparable <NSObject> // Here we have the NSObject protocol!

-(int) compare:(id) other;

@end
