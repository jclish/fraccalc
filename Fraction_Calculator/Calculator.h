//
//  Calculator.h
//  Fraction_Calculator
//
//  Created by Jourdan Clish on 7/11/14.
//  Copyright (c) 2014 Conure Research Corporation. All rights reserved.
//

#ifndef Fraction_Calculator_Calculator_h
#define Fraction_Calculator_Calculator_h
#import <UIKit/UIKit.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property (strong, nonatomic) Fraction *operand1, *operand2, *accumulator;
-(Fraction *) performOperation: (char) op;
-(void) clear;
@end


#endif
