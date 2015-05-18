//
//  Fraction.m
//  ObjC_Examples
//
//  Created by Mira on 3/16/13.
//  Copyright (c) 2013 ReachUP. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

// Private:

+(int) gcd:(int) a :(int) b {
    if (a == 0) {
        return 1;
    }
    
    if (a < b) {
        return [self gcd:b :a];
    }
    
    if (a % b == 0) {
        return b;
    }
    
    a = a % b;
    return [self gcd: b: a];
}

-(Fraction *) simplify {
    int gcd = [Fraction gcd: abs(numerator) : abs(denominator)];
    if (gcd == 1) {
        return self;
    }
    return ([[Fraction alloc] initWithNum:(numerator / gcd) andDen:(denominator / gcd)]);
}

-(Fraction *) reverse {
    return [[Fraction alloc] initWithNum: denominator andDen: numerator];
}

// Public:

-(id)init {
    return [self init: 1];
}

-(id)init: (int) num {
    return [self initWithNum:num andDen:1];
}

-(id) initWithNum:(int) num andDen:(int)den {
    if (den == 0 ) {
        @throw [NSException exceptionWithName:@"Illegal den" reason: @"The den can not be 0" userInfo: nil];
    }
    
    if (den < 0) {
        den = -den;
        num = -num;
    }
    
    if (self = [super init]) {
        numerator = num;
        denominator = den;
    }
    return [self simplify];
}

-(NSString*) description {
    return [NSString stringWithFormat: @"%d/%d", numerator, denominator];
}

-(Fraction *) negate {
    return [[Fraction alloc] initWithNum:(-numerator) andDen:denominator];
}

-(Fraction *) reduce {
    return [self simplify];
}


-(Fraction *) add: (Fraction *) other {
    int den = self->denominator * other->denominator;
    
    int num = (self->numerator * other->denominator) +
                (other->numerator * self->denominator);
    return [[Fraction alloc] initWithNum:num andDen:den]; 
}

-(Fraction *) multiply: (Fraction *) other {
    int den = self->denominator * other->denominator;
    int num = self->numerator * other->numerator;
    
    return [[Fraction alloc] initWithNum: num andDen:den];
}


-(Fraction *) subtract: (Fraction *) other {
    return [self add:[other negate]];
}

-(Fraction *) divide: (Fraction *) other {
    if (other->numerator == 0) {
        @throw [NSException exceptionWithName:@"Illegal divide" reason: @"Can not divide by 0" userInfo: nil];
    }
    return [self multiply: [other reverse]];   
}

- (BOOL)validateValue:(id *)ioValue forKey:(NSString *)key error:(NSError **)outError {
    NSLog(@"AT VALIDATE");
    if ([@"denominator" isEqualToString: key]) {
        id number = *ioValue;
        int intNum = [number intValue];
        
        if (intNum == 0) {
            NSLog(@"AT ERROR");
            return NO;
        }
    }
    return YES;
}

-(int) compare:(id) other {
    if (![other isKindOfClass: [Fraction class]]) {
        @throw [NSException exceptionWithName:@"Can not compare" reason: @"The argumnt is not valid Fraction type" userInfo: nil];
    }

    return ((self.numerator * ((Fraction*)other).denominator) - (((Fraction*)other).numerator * self.denominator));
}

@end
