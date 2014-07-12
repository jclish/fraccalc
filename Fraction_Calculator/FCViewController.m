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
    int             currentNumber;
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

-(void) processDigit: (int) digit
{
    currentNumber=currentNumber* 10 + digit;
    
    [displayString appendString:
     [NSString stringWithFormat:@"%i", digit]];
    display.text=displayString;
}

-(void) processOp: (char) theOp
{
    
}

-(void) storeFracPart
{
    
}

-(IBAction) clickDigit: (UIButton *) sender
{
    
}


-(IBAction)clickPlus
{
    
}
-(IBAction)clickMinus
{
    
}
-(IBAction)clickMultiply
{
    
}
-(IBAction)clickDivide
{
    
}


-(IBAction)clickOver
{
    
}
-(IBAction)clickEquals
{
    
}
-(IBAction)clickClear
{
    
}

@end
