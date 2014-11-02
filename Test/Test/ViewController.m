//
//  ViewController.m
//  Test
//
//  Created by sasha on 05.11.13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorLogic.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        calculatorLogic = [[CalculatorLogic alloc]initWithDelegate:self];
    }
    return self;
}


-(IBAction)digitPress:(id)sender {
    UIButton *button = (UIButton*)sender;
    
    [calculatorLogic setDigit:[button tag]];
    
    /*
    [display setText:[[display text]stringByAppendingString:digit]];
    NSLog(@"digit:%f", [[display text]doubleValue]);
    calculatorLogic.operand = calculatorLogic.operand*10+[button tag];
    */
    
}
 

-(IBAction)equallyPress:(id)sender {
    
    [calculatorLogic setEquality];
    
    /*
    [calculatorLogic performOperation];
    [display setText:[[display text]stringByAppendingString:[NSString stringWithFormat:@"=%f",calculatorLogic.operand]]];
     */
}

-(IBAction)cleanPress:(id)sender {
    
    [display setText:@""];
    
    /*
    calculatorLogic.operand = 0;
    calculatorLogic.waitingOperation = 0;
     */
}


-(IBAction)deleteSymbolPress:(id)sender {
    [calculatorLogic deleteLastSymbol];
}


-(IBAction)memoryExportPress:(id)sender {
    //calculatorLogic.memoryOperand = calculatorLogic.operand;
}

-(IBAction)memoryImportPress:(id)sender {
    //calculatorLogic.operand = calculatorLogic.memoryOperand;
    //[display setText:[[display text]stringByAppendingString:[NSString stringWithFormat:@"%f",calculatorLogic.operand]]];
}


-(IBAction)sqrtPress:(id)sender {
    
    /*
    UIButton *button = (UIButton*)sender;
    calculatorLogic.waitingOperation = [button tag];
    [self equallyPress:sender];
    */
    
}


-(IBAction)operationPress:(id)sender {
    
    UIButton *button = (UIButton*)sender;
    
    [calculatorLogic setOperationWithId:[button tag]];
    
    
    /*
    UIButton *button = (UIButton*)sender;
    
    double mediator = calculatorLogic.operand;
    
    calculatorLogic.waitingOperand = mediator;
    calculatorLogic.waitingOperation = [button tag];
    calculatorLogic.operand = 0;
    
    NSString *operator = [[sender titleLabel]text];
    [display setText:[[display text]stringByAppendingString:operator]];
     */
}


-(void)showString:(NSString*)aString {
    
    [display setText:aString];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
