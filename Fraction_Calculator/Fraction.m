//
//  Fraction.m
//  Fraction_Calculator
//
//  Created by Jourdan Clish on 7/11/14.
//  Copyright (c) 2014 Conure Research Corporation. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

-(void) setTo: (long) n over: (long) d
{
    numerator = n;
    denominator = d;
}
-(void) print
{
    NSLog (@"%li/%li", numerator, denominator);
}
-(double) convertToNum
{
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}
-(NSString *) convertToString
{
    if (numerator == denominator)
        if (numerator == 0)
            return @"0";
        else
            return @"1";
        else if (denominator == 1)
            return [NSString stringWithFormat: @"%li", numerator];
        else
            return [NSString stringWithFormat: @"%li/%li", numerator, denominator];
}
-(Fraction *) add: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator + denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}
-(Fraction *) subtract: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator *f.denominator - denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}
-(Fraction *) multiply: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}
-(Fraction *) divide: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    
    [result reduce];
    return result;
}
- (void) reduce
{
    long u = numerator;
    long v = denominator;
    long temp;
    
    if (u == 0)
        return;
    else if (u <0)
        u = -u;
    
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    numerator /= u;
    denominator /= u;
}
@end