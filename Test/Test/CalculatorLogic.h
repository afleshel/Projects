//
//  CalculatorLogic.h
//  SashaCalculator
//
//  Created by Администратор on 11/2/13.
//  Copyright (c) 2013 Саша. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Symbol;
@class Expression;

@interface CalculatorLogic : NSObject {
    double _operand;
    int _waitingOperation;
    double _waitingOperand;
    double _memoryOperand;
    
    BOOL userIsInTheMiddleOfTypingNumber;
    double firstOperator;
    double secondOperator;
    double operationResult;
    
    Expression *mainExpression;
    
    Expression *childExpression;
    
    NSString *expressionString;
    
    Expression *currentExpression;
    
    BOOL isEqualtyPressed;
    
    id delegate;
}

-(id)initWithDelegate:(id)aDelegate;
-(void)setDigit:(double)digit;
-(void)setOperationWithId:(int)aOperationID;
-(void)setEquality;

-(void)deleteLastSymbol;

@property(nonatomic,readwrite)double operand;
@property(nonatomic,readwrite)double waitingOperand;
@property(nonatomic,readwrite)int waitingOperation;
@property(nonatomic,readwrite)double memoryOperand;

//-(void)performOperation;

@end
