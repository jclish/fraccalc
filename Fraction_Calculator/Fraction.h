//
//  Fraction.h
//  Fraction_Calculator
//
//  Created by Jourdan Clish on 7/11/14.
//  Copyright (c) 2014 Conure Research Corporation. All rights reserved.
//

#ifndef Fraction_Calculator_Fraction_h
#define Fraction_Calculator_Fraction_h

#import <UIKit/UIKit.h>

@interface Fraction : NSObject

@property long numerator, denominator;
-(void)         print;
-(void)         setTo: (long) n over: (long) d;
-(Fraction *)   add: (Fraction *) f;
-(Fraction *)   subtract: (Fraction *) f;
-(Fraction *)   multiply: (Fraction *) f;
-(Fraction *)   divide: (Fraction *) f;
-(void)         reduce;
-(double)       convertToNum;
-(NSString *)   convertToString;
@end

#endif
