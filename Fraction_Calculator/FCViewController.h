//
//  FCViewController.h
//  Fraction_Calculator
//
//  Created by Jourdan Clish on 7/11/14.
//  Copyright (c) 2014 Conure Research Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit: (long) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

//numeric keys
-(IBAction) clickDigit: (UIButton *) sender;

// Arithmatic Operation Keys

-(IBAction)clickPlus;
-(IBAction)clickMinus;
-(IBAction)clickMultiply;
-(IBAction)clickDivide;

// Misc Keys
-(IBAction)clickOver;
-(IBAction)clickEquals;
-(IBAction)clickClear;

@end


