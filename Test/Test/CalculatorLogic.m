//
//  CalculatorLogic.m
//  SashaCalculator
//
//  Created by Администратор on 11/2/13.
//  Copyright (c) 2013 Саша. All rights reserved.
//

#import "CalculatorLogic.h"
#import "Operation.h"
#import "Digit.h"
#import "Equality.h"
#import "Expression.h"


@protocol CalculatorLogicDelegateProtocol
-(void)showString:(NSString*)aString;
@end


@implementation CalculatorLogic
@synthesize operand = _operand;
@synthesize waitingOperand = _waitingOperand;
@synthesize waitingOperation = _waitingOperation;
@synthesize memoryOperand = _memoryOperand;

-(id)initWithDelegate:(id)aDelegate {
    
    if (self = [super init]) {
        delegate = aDelegate;
        mainExpression = [[Expression alloc]init];
        currentExpression = mainExpression;
        expressionString = [[NSString alloc]init];
        firstOperator = 0;
        secondOperator = 0;
        _operand = 0;
    }
    return self;
}


-(void)makeStringFromExpression {
   expressionString = @"";
    for (Symbol*symbol in mainExpression.expression) {
        expressionString = [expressionString stringByAppendingString:symbol.string];
    }
}

-(void)setDigit:(double)digit {
    if (isEqualtyPressed==YES) {
        [mainExpression.expression removeAllObjects];
        isEqualtyPressed = NO;
    }
    
    _operand = _operand*10+digit;
    NSString *digitString = [NSString stringWithFormat:@"%1.0f",digit];
    expressionString = [expressionString stringByAppendingString:digitString];
    
    [delegate showString:expressionString];
}

-(void)setDigit {
    
    Digit *digit = [[Digit alloc]initWithNumber:_operand];
    if (secondOperator == 0) {
        secondOperator = digit.digit;
    }
    
    [currentExpression.expression addObject:digit];
    
    //[expressionSymbol.expression addObject:digit];
}


-(void)setOperationWithId:(int)aOperationID {
    
    if (aOperationID == 3 || aOperationID == 4) {
        if (childExpression == nil) {
            childExpression = [[Expression alloc]init];
            Digit *digitInParentExpression = [[currentExpression.expression lastObject]copy];
            [mainExpression.expression removeLastObject];
            [childExpression.expression addObject:digitInParentExpression];
            currentExpression = childExpression;
        }
    }
    
    if (aOperationID == 1 || aOperationID == 2) {
        if (childExpression) {
            [mainExpression.expression addObject: [childExpression copy]];
            currentExpression = mainExpression;
            childExpression = nil;
        }
    }
    
    if (isEqualtyPressed == YES) {
        [mainExpression.expression removeAllObjects];
        Digit *digit = [[Digit alloc]initWithNumber:secondOperator];
        [mainExpression.expression addObject:digit];
        isEqualtyPressed = NO;
    } else {
        [self setDigit];
        _operand = 0;
    }
    
    Operation *operation = [[Operation alloc]initWithOperationID:aOperationID];
    [currentExpression.expression addObject:operation];
    [self makeStringFromExpression];
    [delegate showString:expressionString];
    
}

/*
-(void)setOperationWithId:(int)aOperationID {
    
    if (isEqualtyPressed == YES) {
        [expressionSymbol.expression removeAllObjects];
        Digit *digit = [[Digit alloc]initWithNumber:secondOperator];
        [expressionSymbol.expression addObject:digit];
        isEqualtyPressed = NO;
    } else {
        
        [self setDigit];
        _operand = 0;
    }
    
    Operation *operation = [[Operation alloc]initWithOperationID:aOperationID];
    [expressionSymbol.expression addObject:operation];
    [self makeStringFromExpression];
    [delegate showString:expressionString];
    
}
 */

-(void)setEquality {
    
    [self setDigit];
    
    double result = [mainExpression calculateExpression];
    
    Equality *equaltySymbol = [[Equality alloc]init];
    
    [mainExpression.expression addObject:equaltySymbol];
    
    Digit *digit = [[Digit alloc]initWithNumber:result];
    [mainExpression.expression addObject:digit];
    
    [self makeStringFromExpression];
    
    isEqualtyPressed = YES;
    _operand = 0;
    
    [delegate showString:expressionString];
}

-(void)calculateExpression {
    
    //Digit *firstDigit = [currentExpression]
    
    //firstOperator = ;
    
    for (Symbol*symbol in mainExpression.expression) {
        if ([symbol class]==[Operation class]) {
            
            int symbolIndex = [mainExpression.expression indexOfObject:symbol];
            
            Symbol *nextSymbol = [mainExpression.expression objectAtIndex:symbolIndex+1];
                
                firstOperator = secondOperator;
                secondOperator = nextSymbol.digit;
                
            secondOperator = [symbol makeOperationWithFirstOperator:firstOperator andSecondOperator:secondOperator];
            
       }
    
    }
    
}

-(void)deleteLastSymbol {
    
    Symbol *lastObject = [mainExpression.expression lastObject];
    
    if ([lastObject class] == [Operation class]) {
        [mainExpression.expression removeObject:lastObject];
    }
    
    
    if ([lastObject class] == [Digit class]) {
        if ([lastObject.string isEqual:@""]) {
            [mainExpression.expression removeObject:lastObject];
            [self deleteLastSymbol];
        } else {
            [lastObject removeLastDigit];
        }
    }
    
    [self makeStringFromExpression];
    [delegate showString:expressionString];
}

@end
