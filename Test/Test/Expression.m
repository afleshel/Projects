//
//  Expression.m
//  Test
//
//  Created by Администратор on 11/10/13.
//  Copyright (c) 2013 sasha. All rights reserved.
//

#import "Expression.h"
#import "Digit.h"
#import "Operation.h"

@implementation Expression
@synthesize expression = _expression;

-(id)init {
    
    if (self = [super init]) {
        _expression = [[NSMutableArray alloc]init];
    }
    
    return self;
}

-(double)calculateExpression {
    
    Symbol *firstSymbol = [_expression objectAtIndex:0];
    
    double firstOperator = [firstSymbol getDigit];
    double secondOperator;
    
    for (Symbol*symbol in _expression) {
        if ([symbol class]==[Operation class]) {
            
            int symbolIndex = [_expression indexOfObject:symbol];
            
            Symbol *nextSymbol = [_expression objectAtIndex:symbolIndex+1];
            
            secondOperator = [nextSymbol getDigit];
            firstOperator = [symbol makeOperationWithFirstOperator:firstOperator andSecondOperator:secondOperator];
            
            secondOperator = [symbol makeOperationWithFirstOperator:firstOperator andSecondOperator:secondOperator];
        }
        
    }
    return firstOperator;
    
}

-(double)getDigit {
    double result = [self calculateExpression];
    return result;
}

-(id)copyWithZone:(NSZone*)zone {
    Expression *expression = [[Expression alloc]init];
    expression.expression = [[NSMutableArray alloc]initWithArray:_expression copyItems:YES];
    return expression;
}

@end

