//
//  ViewController.h
//  Test
//
//  Created by sasha on 05.11.13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalculatorLogic;

@interface ViewController : UIViewController {
    IBOutlet UILabel *display;
    CalculatorLogic *calculatorLogic;
    BOOL userIsInTheMiddleOfTypingNumber;
}

-(IBAction)digitPress:(id)sender;
-(IBAction)operationPress:(id)sender;
-(IBAction)equallyPress:(id)sender;
-(IBAction)cleanPress:(id)sender;
-(IBAction)memoryExportPress:(id)sender;
-(IBAction)memoryImportPress:(id)sender;
-(IBAction)sqrtPress:(id)sender;
-(IBAction)deleteSymbolPress:(id)sender;

@end
