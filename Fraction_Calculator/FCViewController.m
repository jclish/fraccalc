//
//  FCViewController.m
//  Fraction_Calculator
//
//  Created by Jourdan Clish on 7/11/14.
//  Copyright (c) 2014 Conure Research Corporation. All rights reserved.
//

#import "FCViewController.h"
#import "Calculator.h"

@implementation FCViewController
{
    char            op;
    long             currentNumber;
    BOOL            firstOperand, isNumerator;
    Calculator      *myCalculator;
    NSMutableString *displayString;
}
@synthesize display;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator=YES;
    displayString=[NSMutableString stringWithCapacity:40];
    myCalculator=[[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) processDigit: (long) digit
{
    currentNumber=currentNumber* 10 + digit;
    
    [displayString appendString:
     [NSString stringWithFormat:@"%li", digit]];
    display.text=displayString;
}

-(IBAction) clickDigit: (UIButton *) sender
{
    long digit = sender.tag;
    
    [self processDigit: digit];
}

-(void) processOp: (char) theOp
{
    NSString    *opStr;
    
    op=theOp;
    
    switch (theOp) {
        case '+':
            opStr=@" + ";
            break;
        case '-':
            opStr=@" - ";
            break;
        case '*':
            opStr=@" X ";
            break;
        case '/':
            opStr=@" ÷ ";
            break;
        default:
            break;
    }
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString: opStr];
    display.text = displayString;
}

-(void) storeFracPart
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1; // e.g. 3 * 4/5 =
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1; // e.g. 3/2 * 4 =
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    currentNumber = 0;
}

-(IBAction)clickPlus
{
    [self processOp: '+'];
}

-(IBAction)clickMinus
{
    [self processOp: '-'];
}

-(IBAction)clickMultiply
{
    [self processOp: '*'];
}

-(IBAction)clickDivide
{
    [self processOp: '/'];
}

-(IBAction)clickOver
{
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    display.text = displayString;
}

-(IBAction)clickEquals
{
    if ( firstOperand == NO ) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString: @""];
    }
}

-(IBAction)clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;
}



@end

