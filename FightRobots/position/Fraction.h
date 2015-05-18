//
//  Fraction.h
//  ObjC_Examples
//
//  Created by Mira on 3/16/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comparable.h"

@interface Fraction : NSObject<Comparable> {
    @private
    int numerator, denominator;
}

@property (assign, atomic, readonly) int numerator, denominator;

-(id)init;
-(id)init: (int) num;
-(id) initWithNum:(int) num andDen:(int)den;

-(Fraction *) negate; // unary minus operation
-(Fraction *) reduce;
-(Fraction *) add: (Fraction *) other;
-(Fraction *) multiply: (Fraction *) other;
-(Fraction *) subtract: (Fraction *) other;
-(Fraction *) divide: (Fraction *) other;

+(int) gcd:(int) a :(int) b;
@end
